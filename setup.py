from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize

ext_modules = (
    Extension(
        "interface",
        ["interface.pyx"],
        extra_compile_args=['-std=c++14', '-fopenmp', '-Wall', '-Wextra', '-Weffc++', '-O2'],
        extra_link_args=['-fopenmp'],
    )
)

setup(
    name= 'color',
    ext_modules=cythonize(ext_modules),
)
