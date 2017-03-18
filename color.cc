#include "color.hh"

Color::Color() {}

std::vector<unsigned char>* Color::grayscale(const std::vector<unsigned char> &img) {
    auto ans = new std::vector<unsigned char>(img.size() / 3);

    #pragma omp parallel for simd
    for (size_t i = 0; i < img.size(); i += 3) {
        unsigned char pixel = (unsigned char)((float)img[i] * 0.21);
        pixel += (unsigned char)((float)img[i + 1] * 0.71);
        pixel += (unsigned char)((float)img[i + 2] * 0.08);
        (*ans)[i / 3] = pixel; 
    }
    return ans;
}
