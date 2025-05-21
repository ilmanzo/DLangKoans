module koans.bitwise_operators;

import koans.helpers;

unittest  // shifts()
{
    auto i = 1;
    auto j = -8;
    assert(j << 3 == FILL_IN_THIS_NUMBER);
    assert(j >>> 3 == FILL_IN_THIS_NUMBER);
    assert(j >> 3 == FILL_IN_THIS_NUMBER);
    assert(i << 3 == FILL_IN_THIS_NUMBER);
}

unittest  // operators()
{
    assert((2 | 4) == FILL_IN_THIS_NUMBER); // or
    assert((3 & 5) == FILL_IN_THIS_NUMBER); // and
    assert((6 ^ 4) == FILL_IN_THIS_NUMBER); // xor
    assert((~3) == FILL_IN_THIS_NUMBER); // not
}
