module koans.static_if_version;

import koans.helpers;

// static if conditionally compiles code at compile time
string typeDescription(T)()
{
    static if (is(T == int))
    {
        return "integer";
    }
    else static if (is(T == string))
    {
        return "text";
    }
    else
    {
        return "other";
    }
}

unittest  // static_if_selects_code_at_compile_time()
{
    assert(typeDescription!int() == FILL_IN_THIS_STRING);
    assert(typeDescription!string() == FILL_IN_THIS_STRING);
    assert(typeDescription!double() == FILL_IN_THIS_STRING);
}

unittest  // version_unittest_is_defined()
{
    int testFlag = 0;
    version (unittest)
    {
        testFlag = 1;
    }
    assert(testFlag == FILL_IN_THIS_NUMBER);
}

struct ItemContainer(T)
{
    T item;

    static if (is(T == int))
    {
        int doubleValue()
        {
            return item * 2;
        }
    }
}

unittest  // static_if_branch_not_compiled_when_false()
{
    ItemContainer!int intBox;
    intBox.item = 10;

    ItemContainer!string stringBox;
    stringBox.item = "hello";

    assert(__traits(compiles, intBox.doubleValue()) == FILL_IN_TRUE_OR_FALSE);
    assert(!__traits(compiles, stringBox.doubleValue()) == FILL_IN_TRUE_OR_FALSE);
    assert(intBox.doubleValue() == FILL_IN_THIS_NUMBER);
}
