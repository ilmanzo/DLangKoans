module about_c_interop;

import dunit;
import helpers;

extern (C) { 
    int simple_c_function(int a, int b)
    {
        return a+b+42;
    }

    void pointers_c_function(int* n)
    {
        *n+=3;
    }

    char string_c_function(const char* str)
    {
        return str[3];
    }
}


class AboutCInterop {
    mixin UnitTest;

    @Test
    public void callSimpleCfunction() {
        assertEquals(simple_c_function(10,20),FILL_IN_THIS_NUMBER);
    }

    @Test
    public void pointers_are_interoperable() {
        auto x=5;
        pointers_c_function(&x);
        assertEquals(x,FILL_IN_THIS_NUMBER);
    }

    @Test
    public void working_with_c_strings() {
        //string literals are fine
        assertEquals(string_c_function("This is a test"),FILL_IN_THIS_CHAR);
        // variables needs to be converted 
        auto message="Just another test";
        import std.string : toStringz;
        auto result=string_c_function(toStringz(message));
        assertEquals(result,FILL_IN_THIS_CHAR);
    }

}
