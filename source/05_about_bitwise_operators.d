module about_bitwise_operators;

import dunit;
import helpers;

class AboutBitwiseOperators
{
  mixin UnitTest;

  @Test
  void shifts() {
    auto i = 1;
    auto j = -8;
    assertEquals(j << 3, FILL_IN_THIS_NUMBER);
    assertEquals(j >>> 3, FILL_IN_THIS_NUMBER);
    assertEquals(j >> 3, FILL_IN_THIS_NUMBER);
    assertEquals(i << 3, FILL_IN_THIS_NUMBER);
  }

  @Test
  void operators() {
    assertEquals(2 | 4, FILL_IN_THIS_NUMBER); // or
    assertEquals(3 & 5, FILL_IN_THIS_NUMBER); // and
    assertEquals(6 ^ 4, FILL_IN_THIS_NUMBER); // xor
    assertEquals(~3, FILL_IN_THIS_NUMBER);  // not
  }

}
