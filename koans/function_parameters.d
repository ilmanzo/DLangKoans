module koans.function_parameters;

import koans.helpers;

// parameters are passed by value as default and ALWAYS copied

void decrement(int value)
{
    value -= 10;
}

unittest  // testParameterByValue()
{
    auto number = 100;
    decrement(number);
    assert(number == FILL_IN_THIS_NUMBER);
}

// ... this is also true for slices
// but you can force the reference semantic by adding a "ref" qualifier

void wrong_append(int[] arr, int elem)
{
    arr ~= elem; // this doesn't work as expected
}

void right_append(ref int[] arr, int elem)
{
    arr ~= elem; // that's better
}

unittest  // testSliceParameter()
{

    auto my_array = [4, 8, 15, 16, 23];
    wrong_append(my_array, 42);
    assert(my_array.length == FILL_IN_THIS_NUMBER);
    right_append(my_array, 42);
    assert(my_array.length == FILL_IN_THIS_NUMBER);
}

// parameters can have "in" and "out" qualifiers, 
// where "in" stands for input and
// "out" for values that will be returned to the caller

int sumAndProduct(in int n1, in int n2, out int product)
{
    product = n1 * n2;
    return n1 + n2;
}

unittest  // exerciseInOutParameters()
{
    int prod;
    int result = sumAndProduct(7, 3, prod);
    assert(result == FILL_IN_THIS_NUMBER);
    assert(prod == FILL_IN_THIS_NUMBER);
}

/*-----------------------------------------*/
