module about_numbers;

import dunit;
import helpers;

class AboutNumbers {
  mixin UnitTest;

  // fill in the value replacing the underscore

  @Test
  void integersEqual() {
    auto integer = 1;
    auto expected = FILL_IN_THIS_NUMBER;
    assertEquals(expected, integer);
  }

  @Test
  void integersHaveSize() {
    int an_integer = 1;
    assertEquals(int.sizeof, FILL_IN_THIS_NUMBER);
    assertEquals(an_integer.sizeof, FILL_IN_THIS_NUMBER);
  }

  // hint: here you may want to use assertLessThan
  @Test
  void integersCanBeNegative() {
    int an_integer = -42;
    assertEquals(an_integer, 0);
  }

  @Test
  void integersHaveProperties() {
    int my_integer = 36;
    assertEquals(my_integer.init, FILL_IN_THIS_NUMBER);      // initial value
    assertEquals(my_integer.stringof, FILL_IN_THIS_STRING);  // string representation
  }
}
