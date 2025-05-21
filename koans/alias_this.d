//use this empty template as a start for writing new 'about' entries
module koans.alias_this;

import koans.helpers;

/* 'alias this' enables automatic type conversions 
  (also known as implicit type conversions) 
  of user-defined types. 
  The value of the member becomes the resulting value of the
  conversion. */

struct A
{
    string name;
    int n;
    alias n this;
}

struct B
{
    int foo()
    {
        return 1;
    }

    alias foo this;
}

int sum(int a, int b) // function sum() takes 2 int ..
{
    return a + b;
}

unittest  // type_conversion()
{
    A a = {name: "the A struct", n: 11};
    B b;
    auto result = sum(a, b); // but we can pass our struct
    assert(result == FILL_IN_THIS_NUMBER);
}

unittest  // assignment()
{
    A a = {name: "another A struct", n: 11};
    a.n = 19; // think what does this ... Is it legal ? Why ?
    assert(a == FILL_IN_THIS_NUMBER);
}
