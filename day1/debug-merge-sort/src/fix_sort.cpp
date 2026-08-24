#include <iostream>
#include <vector>
#include <algorithm>

void merge_sort_inner(std::span<int> in)
{
    if (std::ssize(in) <= 1)
    {
        return;
    }

    size_t mid = std::ssize(in) / 2;
    auto left = std::span<int>(in.begin(), in.begin() + mid);
    auto right = std::span<int>(in.begin() + mid, in.end());
  
    merge_sort_inner(left);
    merge_sort_inner(right);

    return std::inplace_merge(in.begin(), in.begin() + mid, in.end());
}

std::vector<int> merge_sort(std::vector<int> in)
{
    merge_sort_inner(in);
    return in;
  }

int main()
{
    std::vector<int> values = {3, 1, 4, 1, 5, 9, 2, 6};

    auto sorted = merge_sort(values);

    for (int x : sorted)
    {
        std::cout << x << " ";
    }

    std::cout << "\n";
}