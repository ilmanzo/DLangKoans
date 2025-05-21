module koans.exceptions;

import koans.helpers;

private class Bad_area : Exception
{
    public this(string msg)
    {
        super(msg);
    }
}

private class Something_else : Exception
{
    public this(string msg)
    {
        super(msg);
    }
}

private int area(int length, int width)
{
    if (length <= 0 || width <= 0)
        throw new Bad_area("bad area!");
    if (length == 4 || width == 0)
        throw new Something_else("Something else!");
    return length * width;
}

unittest  // aboutThrowingSomething()
{
    auto result = 0;
    auto area1 = 0;
    try
    {
        area1 = area(4, 2);
    }
    catch (Bad_area be)
    {
        result = 1;
    }
    catch (Exception e)
    {
        result = 2;
    }

    assert(area1 == FILL_IN_THIS_NUMBER);
    assert(result == FILL_IN_THIS_NUMBER);
}

// unittest  // aboutEnforce()
// {
//     import std.exception : enforce;

//     auto exception = expectThrows(enforce(false));
//     assert(exception.msg == FILL_IN_THIS_STRING);
// }
