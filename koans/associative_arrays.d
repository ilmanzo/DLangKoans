module koans.associative_arrays;

import koans.helpers;

unittest  // creation_and_assignment()
{
    int[string] mymap;
    mymap["hello"] = 3;
    assert(mymap["hello"] == FILL_IN_THIS_NUMBER);
}

unittest  // other_operations()
{
    int[string] ages = ["bob": 20, "joe": 30, "dan": 40];

    assert(ages.length == FILL_IN_THIS_NUMBER);

    auto age = ages["bob"];
    assert(age == FILL_IN_THIS_NUMBER);

    ages["bob"] = 77;
    assert(ages["bob"] == FILL_IN_THIS_NUMBER);

    import core.exception : RangeError;

    try
    {
        age = ages["steven"];
    }
    catch (RangeError e)
    {
        // accessing non existing elements raise an exception
        assert(e.msg == FILL_IN_THIS_STRING);
    }

    ages["steven"] = 66; //new ones can be added
    assert(ages["steven"] == FILL_IN_THIS_NUMBER);

    assert(ages.length == FILL_IN_THIS_NUMBER);

    ages.remove("joe"); // you can also remove elements

    assert(ages.length == FILL_IN_THIS_NUMBER);
}

unittest  // keys_and_values()
{
    string[string] colors = [
        "black": "000000", "white": "FFFFFF", "red": "FF0000",
        "green": "00FF00", "blue": "0000FF"
    ];
    assert(colors.keys.length == FILL_IN_THIS_NUMBER); // .keys gives an array with all the keys
    assert(colors.values.length == FILL_IN_THIS_NUMBER); // same for .values

}
