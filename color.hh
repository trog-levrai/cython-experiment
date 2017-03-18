#pragma once

#include <iostream>
#include <string>
#include <vector>

class Color {
    public:
        Color();
        std::vector<unsigned char>* grayscale(const std::vector<unsigned char>&);
};
