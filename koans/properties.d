module koans.properties;

import koans.helpers;

unittest  // nativeProperties()
{
    auto x = 3;
    assert(x.sizeof == FILL_IN_THIS_NUMBER);
    assert(typeof(x).stringof == FILL_IN_THIS_STRING);
}

unittest  // userDefinedProperties()
{
    struct Rectangle
    {
        int width;
        int height;
        @property auto area()
        {
            return width * height;
        }
    }

    Rectangle r;
    r.width = 4;
    r.height = 3;
    assert(r.area == FILL_IN_THIS_NUMBER);
}
