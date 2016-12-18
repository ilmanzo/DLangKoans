module about_enum;

import dunit;
import helpers;

class AboutEnum {
  mixin UnitTest;

  enum Color { RED = 1, GREEN, BLUE }

  @Test
  void enums_have_properties() {
    assertEquals(Color.init, FILL_IN_THIS_NUMBER);
    assertEquals(Color.min, FILL_IN_THIS_NUMBER);
    assertEquals(Color.max, FILL_IN_THIS_NUMBER);
    assertEquals(Color.sizeof, FILL_IN_THIS_NUMBER);
  }

}
