import time
import picamera
import numpy as np
from PIL import Image

camera = picamera.PiCamera()

camera.resolution = (320, 240)
camera.framerate = 24
time.sleep(2)
output = np.empty((240, 320, 3), dtype=np.uint8)
camera.capture(output, 'rgb')

im = Image.fromarray(output)
im.save("filename.jpeg")

camera.close()
