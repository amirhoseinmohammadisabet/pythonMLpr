import matplotlib.pyplot as plt
import numpy as np
import skimage

from skimage import data, io

img = data.coffee()
io.imsave('coffee.png', img)


