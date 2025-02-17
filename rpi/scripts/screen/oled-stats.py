import time
import psutil
from PIL import Image, ImageDraw, ImageFont
from luma.oled.device import ssd1306
from luma.core.interface.serial import i2c

# Initialize I2C connection
serial = i2c(port=1, address=0x3C)
device = ssd1306(serial)

# Load a font
font = ImageFont.load_default()

def get_stats():
    """Fetch system stats"""
    cpu = psutil.cpu_percent()
    mem = psutil.virtual_memory().percent
    disk = psutil.disk_usage('/').percent
    temp = psutil.sensors_temperatures().get('cpu_thermal', [{}])[0].get('current', 0)
    return f"CPU: {cpu}%\nRAM: {mem}%\nDisk: {disk}%\nTemp: {temp:.1f}C"

while True:
    # Create a blank image
    image = Image.new("1", (device.width, device.height), "black")
    draw = ImageDraw.Draw(image)

    # Get stats and draw on screen
    stats = get_stats()
    draw.text((0, 0), stats, font=font, fill="white")

    # Display the image
    device.display(image)

    time.sleep(2)