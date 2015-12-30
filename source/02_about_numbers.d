module about_numbers;

import helpers;
import dunit;

class AboutNumbers {
  mixin UnitTest;

  // fill in the value replacing the underscore

  @Test
  public void IntegersEqual() {
    auto integer = 1;
    auto expected = FILL_IN_THIS_NUMBER;
    assertEquals(expected, integer);
  }

  @Test
  public void IntegersHaveSize() {
    int an_integer = 1;
    assertEquals(int.sizeof, FILL_IN_THIS_NUMBER);
    assertEquals(an_integer.sizeof, FILL_IN_THIS_NUMBER);
  }

  // hint: here you may want to use assertLessThan
  @Test
  public void IntegersCanBeNegative() {
    int an_integer = -42;
    assertEquals(an_integer, 0);
  }
}
