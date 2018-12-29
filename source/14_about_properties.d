module about_properties;

import dunit;
import helpers;

class AboutProperties {
  mixin UnitTest;

  @Test
  public void nativeProperties() {
    auto x = 3;
    assertEquals(x.sizeof, FILL_IN_THIS_NUMBER);
    assertEquals(typeof(x).stringof, FILL_IN_THIS_STRING);
  }

  @Test
  public void userDefinedProperties() {
    struct Rectangle {
      int width;
      int height;
      @property auto area() { return width * height;}
    }

    Rectangle r;
    r.width = 4;
    r.height = 3;
    assertEquals(r.area, FILL_IN_THIS_NUMBER);
  }

}
