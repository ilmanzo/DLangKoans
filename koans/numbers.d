module koans.numbers;

import koans.helpers;

// fill in the value replacing the underscore

unittest
{
    auto integer = 1;
    auto expected = FILL_IN_THIS_NUMBER;
    assert(expected == integer);
}

unittest
{
    int an_integer = 1;
    assert(int.sizeof == FILL_IN_THIS_NUMBER);
    assert(an_integer.sizeof == FILL_IN_THIS_NUMBER);
}

// hint: here you may want to change assert condition
unittest
{
    int an_integer = -42;
    assert(an_integer == 0);
}

unittest
{
    int my_integer = 36;
    assert(my_integer.init == FILL_IN_THIS_NUMBER); // initial value
    assert(my_integer.stringof == FILL_IN_THIS_STRING); // string representation
}

unittest
{
    uint binNumber = 0b_10000000_00000000_00000000_00000000;
    uint hexNumber = 0x_0030_a00f;
    assert(binNumber == FILL_IN_THIS_NUMBER);
    assert(hexNumber == FILL_IN_THIS_NUMBER);
}
