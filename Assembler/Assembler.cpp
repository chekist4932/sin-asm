#include <iostream>

extern "C"
int sumper(int, int);
extern "C"
int gen_array(int *, int);
extern "C"
int bumble_sort(int *, int);

int main()
{
   int const array_size = 20;
    int arr[array_size];
    //std::cout << sumper(55, 600) << "\n";
    gen_array(arr, array_size);
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
    }

}