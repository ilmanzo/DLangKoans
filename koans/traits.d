module koans.traits;

import koans.helpers;

/*
*  Traits are extensions to the language to enable programs, at compile time,
*  to get at information internal to the compiler. This is also known as compile time reflection.
*/

class MyClass
{
    this()
    {
    }

    ~this()
    {
    }

    void foo()
    {
    }

    int foo(int)
    {
        return 0;
    }
}

unittest  // allMembers()
{
    auto members = [__traits(allMembers, MyClass)];
    assert(members.length == FILL_IN_THIS_NUMBER);
    import std.algorithm : canFind;

    assert(members.canFind("foo") == FILL_IN_TRUE_OR_FALSE);
}
