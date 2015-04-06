module about_enum;

import helpers;
import dunit;

class AboutEnum {
  mixin UnitTest;

  @Test
  enum Color { RED = 1, GREEN, BLUE };

  public void enum_properties() {
    assertEquals(Color.init, FILL_IN_THIS_NUMBER);
    assertEquals(Color.min, FILL_IN_THIS_NUMBER);
    assertEquals(Color.max, FILL_IN_THIS_NUMBER);
    assertEquals(Color.sizeof, FILL_IN_THIS_NUMBER);
  }

}
