module koans.c_interop;

import koans.helpers;

extern (C)
{
    int simple_c_function(int a, int b)
    {
        return a + b + 42;
    }

    void pointers_c_function(int* n)
    {
        *n += 3;
    }

    char string_c_function(const char* str)
    {
        return str[3];
    }
}

unittest  // callSimpleCfunction()
{
    assert(simple_c_function(10, 20) == FILL_IN_THIS_NUMBER);
}

unittest  // pointers_are_interoperable()
{
    auto x = 5;
    pointers_c_function(&x);
    assert(x == FILL_IN_THIS_NUMBER);
}

unittest  // working_with_c_strings()
{
    //string literals are fine
    assert(string_c_function("This is a test") == FILL_IN_THIS_CHAR);
    // variables needs to be converted 
    auto message = "Just another test";
    import std.string : toStringz;

    auto result = string_c_function(toStringz(message));
    assert(result == FILL_IN_THIS_CHAR);
}
