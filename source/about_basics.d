module about_basics;

import helpers;
import dunit;

import std.math;  // for isNaN

class AboutBasics
{
  mixin UnitTest;

  struct k {
    int x;
    float f;
    string s;
  }

  @Test
  void about_basics() {
    assertEquals(true, FILL_IN_TRUE_OR_FALSE, "what is truth ?");
    assertEquals(5 % 2, FILL_IN_THIS_NUMBER);
    assertEquals(5 * 2, FILL_IN_THIS_NUMBER);
    assertEquals(5 ^ 2, FILL_IN_THIS_NUMBER);

    //zero values
    int x;
    assertEquals(x, FILL_IN_THIS_NUMBER);

    //for all types
    float f;
    assertEquals(isNaN(f),FILL_IN_TRUE_OR_FALSE);  // float equality is not defined, e.g. nan != nan

    k c;  //also composite gets default initializers

    assertEquals(c.x, FILL_IN_THIS_NUMBER);
    assertEquals(isNaN(c.f), FILL_IN_TRUE_OR_FALSE);
    assertEquals(c.s, FILL_IN_THIS_STRING);
  }

}
