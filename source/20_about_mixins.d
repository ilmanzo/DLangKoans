module about_mixins;

import dunit;
import helpers;

int helper(int a, int b) {
  return a*2+b*2;
}

class AboutMixins {
  mixin UnitTest;

  /* from the DLang tour:
  The mixin expression takes an arbitrary string and compiles it and generates instructions accordingly. 
  It is purely a compile-time mechanism and can only work on strings available during compilation - 
  a comparison with the evil JavaScript eval would be highly unfair. 
  */

  @Test
  void first_very_simple_mixin() {
    auto n= mixin("3+2");
    assertEquals(n,FILL_IN_THIS_NUMBER);
  }

  @Test
  void another_simple_mixin() {
    const part1="int n=he";
    const part2="lper(3,2);";
    mixin(part1~part2);
    assertEquals(n,FILL_IN_THIS_NUMBER); // where n came from ?
  }

@Test
  void a_more_interesting_mixin() {
      
      auto calc(string op, T)(T lhs, T rhs)
      {
          return mixin("lhs " ~ op ~ " rhs");
      }

      auto n=calc!"+"(2,2);
      assertEquals(n,FILL_IN_THIS_NUMBER); // templatized mixin, why not ?

  }

}
