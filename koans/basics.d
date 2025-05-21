module koans.basics;

import koans.helpers;

import std.math; // for isNaN

struct My_struct
{
    int x;
    float f;
    string s;
}

unittest
{
    assert(true == FILL_IN_TRUE_OR_FALSE);
    assert(5 % 2 == FILL_IN_THIS_NUMBER);
    assert(5 * 2 == FILL_IN_THIS_NUMBER);
    assert((5 ^ 2) == FILL_IN_THIS_NUMBER);

    //zero values
    int x;
    assert(x == FILL_IN_THIS_NUMBER);

    //for all types
    float f;
    assert(isNaN(f) == FILL_IN_TRUE_OR_FALSE); // float equality is not defined, e.g. nan != nan

    My_struct c; //also composite gets default initializers

    assert(c.x == FILL_IN_THIS_NUMBER);
    assert(isNaN(c.f) == FILL_IN_TRUE_OR_FALSE);
    assert(c.s == FILL_IN_THIS_STRING);
}
