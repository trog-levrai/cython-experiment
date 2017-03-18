SETUP=setup.py

all:
	python3 $(SETUP) build_ext --inplace

check: all
	./grayscale.py

clean:
	$(RM) -r build interface.cpp *.so
