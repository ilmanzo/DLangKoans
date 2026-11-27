module koans.foreach_loop;

import koans.helpers;

unittest  // arrays_iteration()
{
    auto array = [3, 4, 5, 6];

    foreach (x; array)
    { // simple iteration, what is the scope of 'x'?
        x = x * 2;
    }
    assert(array[0] == FILL_IN_THIS_NUMBER);

    foreach (ref x; array)
    { // what is changed ?
        x = x * 2;
    }
    assert(array[0] == FILL_IN_THIS_NUMBER);
}

unittest  // strings_iteration()
{ // in D, string are immutable arrays of chars
    char k;

    foreach (c; "this is a short string")
    {
        k = c;
    }

    assert(k == FILL_IN_THIS_CHAR);
}

unittest  // foreach_with_associative_arrays()
{
    int[string] aa;
    string s;
    int v;

    aa["Torvalds"] = 1969;
    aa["Stallman"] = 1953;
    aa["Kernighan"] = 1942;
    aa["Ritchie"] = 1941;

    foreach (key, value; aa)
    {
        s ~= key[0];
        v += value - 1900;
    }

    assert(s.length == FILL_IN_THIS_NUMBER); // iteration order of an associative array is unspecified!
    assert(v == FILL_IN_THIS_NUMBER);
}
