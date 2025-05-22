module koans.ref_functions;

import koans.helpers;

// A ref function returns by reference (instead of by value). The return value of a ref function must be an lvalue

unittest
{
    int* p;

    ref int foo()
    {
        p = new int(2);
        return *p;
    }

    int i = foo();
    assert(i == FILL_IN_THIS_NUMBER);

    foo() = 3; // reference returns can be lvalues
    assert(*p == FILL_IN_THIS_NUMBER);
}
