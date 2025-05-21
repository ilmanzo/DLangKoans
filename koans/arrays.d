module koans.arrays;

import koans.helpers;

unittest  // fixed_length_arrays()
{
    string[4] fruits = ["banana", "mango", "apple", "orange"];
    assert(fruits[0] == FILL_IN_THIS_STRING);
    assert(fruits.length == FILL_IN_THIS_NUMBER);
    int[5] b = 1; // 5 elements with same value 1
    assert(b == FILL_IN_THIS_ARRAY);
}

unittest  // dynamic_length_arrays()
{
    string[] fruits = ["banana", "mango"];
    assert(fruits.length == FILL_IN_THIS_NUMBER);
    fruits ~= "strawberry";
    assert(fruits.length == FILL_IN_THIS_NUMBER);
    assert(fruits[2] == FILL_IN_THIS_STRING);
}

unittest  // array_slicing()
{
    int[] a = [4, 3, 2, 1];
    a[0 .. 2] = [1, 2];
    assert(a == FILL_IN_THIS_ARRAY);
    a[0 .. $] = [0, 0, 0, 0]; // $ is always the last element
    assert(a == FILL_IN_THIS_ARRAY);
}

unittest  // array_append()
{
    int[] a;
    a.length = 3; // length extended, elements using default value
    assert(a == FILL_IN_THIS_ARRAY);
    a ~= [3, 4];
    assert(a == FILL_IN_THIS_ARRAY);
}

unittest  // slices_of_the_same_array()
{
    int[] items = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144];
    auto slice1 = items[2 .. 9];
    auto slice2 = items[4 .. 7];
    assert(slice1[0] == FILL_IN_THIS_NUMBER);
    assert(slice2[0] == FILL_IN_THIS_NUMBER);
    slice1[3] = 99;
    assert(slice2[1] == FILL_IN_THIS_NUMBER);
    slice2.length = 2; //truncating a slice...
    assert(items.length == FILL_IN_THIS_NUMBER); // ... changes original array lenght ?
}
