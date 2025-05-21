module koans.templates;

import koans.helpers;

T twice(T)(T value)
{ //shortcut syntax
    return 2 * value;
}

T twice(T : string)(T value)
{ // specialization
    return value ~ value;
}

unittest  // functionTemplates()
{
    auto val1 = twice!int(2); // instantiation
    assert(val1 == FILL_IN_THIS_NUMBER);
    auto val2 = twice("hello");
    assert(val2 == FILL_IN_THIS_STRING);
}
