module about_exceptions;

import dunit;
import helpers;

class AboutExceptions {
  mixin UnitTest;

  private  class Bad_area: Exception {
      public this(string msg) { super(msg); }
  }

  private class Something_else : Exception {
      public this(string msg) { super(msg); }
  }

  private int area(int length, int width) {
    if (length <= 0 || width <= 0)
        throw new Bad_area("bad area!");
    if (length == 4 || width == 0)
        throw new Something_else("Something else!");
    return length * width;
  }

  @Test
  void aboutThrowingSomething() {
    auto result = 0;
    auto area1=0;
    try {
        area1 = area(4, 2);
    } catch (Bad_area be) {
        result = 1;
    } catch (Exception e) {
        result = 2;
    }

    assertEquals(area1,FILL_IN_THIS_NUMBER);
    assertEquals(result,FILL_IN_THIS_NUMBER);
   }

  @Test
  void aboutEnforce() {
    import std.exception : enforce;
    auto exception = expectThrows(enforce(false));
    assertEquals(exception.msg,FILL_IN_THIS_STRING);
  }


}
