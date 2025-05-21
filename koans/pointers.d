module koans.pointers;

import koans.helpers;

unittest  // pointerDereference()
{
    int a = 3;
    int* p = &a;
    *p = 4;
    assert(a == FILL_IN_THIS_NUMBER);
}
