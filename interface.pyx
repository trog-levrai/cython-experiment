# distutils: language = c++
# distutils: sources = color.cc

from libcpp.string cimport string
from libcpp.vector cimport vector
from cython.operator cimport dereference as deref
from PIL import Image

cdef extern from "color.hh":
    cdef cppclass Color:
        Color() except +
        vector[unsigned char]* grayscale(const vector[unsigned char] &image)

def cppCall():
    cdef Color color
    im = Image.open("tests/antilope.jpeg")
    data = []
    for i in list(im.getdata()):
        for j in i:
            data.append(j)
    gray = color.grayscale(data)
    #Mode L is for 8bits grayscale
    grey = Image.new('L', im.size)
    grey.putdata(deref(gray))
    grey.show()
    del gray
