module about_associative_arrays;

import dunit;
import helpers;

class AboutAssociativeArrays
{
  mixin UnitTest;

  @Test
  void creation_and_assignment() {
    int[string] mymap;
    mymap["hello"] = 3;
    assertEquals(mymap["hello"], FILL_IN_THIS_NUMBER);
  }

  @Test
  void other_operations() {
    int[string] ages = ["bob" : 20, "joe" : 30, "dan" : 40];

    assertEquals(ages.length, FILL_IN_THIS_NUMBER);

    auto age = ages["bob"];
    assertEquals(age, FILL_IN_THIS_NUMBER);

    ages["bob"] = 77;
    assertEquals(ages["bob"], FILL_IN_THIS_NUMBER);

    import core.exception: RangeError;
    try
    {
      age = ages["steven"];
    }
    catch (RangeError e)
    {
      // accessing non existing elements raise an exception
      assertEquals(e.msg, FILL_IN_THIS_STRING);
    }

    ages["steven"] = 66;  //new ones can be added
    assertEquals(ages["steven"], FILL_IN_THIS_NUMBER);

    assertEquals(ages.length, FILL_IN_THIS_NUMBER);

    ages.remove("joe");  // you can also remove elements

    assertEquals(ages.length, FILL_IN_THIS_NUMBER);
  }

  @Test
    void keys_and_values() {
      string[string] colors =  [ "black":"000000",
                                 "white":"FFFFFF",
                                 "red"  :"FF0000",
                                 "green":"00FF00",
                                 "blue" :"0000FF"];
      assertEquals(colors.keys.length,FILL_IN_THIS_NUMBER);   // .keys gives an array with all the keys
      assertEquals(colors.values.length,FILL_IN_THIS_NUMBER); // same for .values

    }

}
