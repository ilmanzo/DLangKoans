module koans.enums;

import koans.helpers;

enum Color
{
    RED = 1,
    GREEN,
    BLUE
}

unittest  // enums_have_properties()
{
    assert(Color.init == FILL_IN_THIS_NUMBER);
    assert(Color.min == FILL_IN_THIS_NUMBER);
    assert(Color.max == FILL_IN_THIS_NUMBER);
    assert(Color.sizeof == FILL_IN_THIS_NUMBER);
}
