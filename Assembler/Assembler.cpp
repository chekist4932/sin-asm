#include <iostream>
#define _USE_MATH_DEFINES // for C++
#include <math.h>

extern "C"
int sumper(int, int);
extern "C"
int gen_array(int *, int);
extern "C"
int bumble_sort(int *, int);
extern "C"
float sin_taylor(float, float);


int main()
{
    //int const array_size = 20;
    //int arr[array_size];
    //std::cout << sumper(55, 600) << "\n";
    /*gen_array(arr, array_size);
    for (int i = 0; i < array_size; i++)
    {
        std::cout << arr[i] << " ";
    }
    std::cout << "\n";
    bumble_sort(arr, array_size);
    //std::cout << '\n' << bumble_sort(arr, array_size) << "\n";
    for (int i = 0; i < array_size; i++)
    {
        std::cout << arr[i] << " ";
    }*/
    int x = 45;
    float arg = M_PI * x / 180;
    float epsilon = 0.0001;
    std::cout << "x in rad: " << arg << std::endl;
    std::cout << "Sin(x) = " << sin_taylor(arg, epsilon) << std::endl;
}