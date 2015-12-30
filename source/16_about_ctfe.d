module about_ctfe;

import helpers;
import dunit;

/* CTFE stands for Compile Time Function Execution;
 * D compiler is able to execute code at compile time
 */

size_t counter;

int sum(int x, int y) {
  return x + y;
}

int factorial(int x) { // a classic
  int result = 1;
  for (auto i = 2; i <= x; i++) {
    result = result * i;
  }
  if (!__ctfe) {
    // This code is for execution at run time
    ++counter;
  }
  return result;
}


class AboutCTFE {
  mixin UnitTest;

  @Test
  public void simple_CTFE() {
    auto a = 1 + 2;  // this expression is evaluated by the compiler (like in C)
    enum b = sum(3, 4);  // but also this
    assertEquals(b, FILL_IN_THIS_NUMBER);
  }


  @Test
  public void advanced_CTFE() {
    auto x = factorial(2);
    enum y = factorial(3);
    assertEquals(x + y, FILL_IN_THIS_NUMBER);
    assertEquals(counter, FILL_IN_THIS_NUMBER);
  }
}
