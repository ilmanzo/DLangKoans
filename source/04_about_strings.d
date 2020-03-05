module about_strings;

import dunit;
import helpers;

class AboutStrings
{
  mixin UnitTest;

  @Test void stringSlicing()
  {
    auto sentence = "The quick brown fox";
    assertEquals(sentence[0], FILL_IN_THIS_CHAR);
    assertEquals(sentence[1 .. 3], FILL_IN_THIS_STRING);
    assertEquals(sentence[$ - 1], FILL_IN_THIS_CHAR);
    assertEquals(sentence[$ - 3 .. $], FILL_IN_THIS_STRING);
  }

  @Test void stringConcatenation()
  {
    auto str1 = "Hello";
    auto str2 = " World";
    auto str = str1 ~ str2;
    assertEquals(str, FILL_IN_THIS_STRING);
  }

  @Test void stringsAreImmutable()
  {
    auto str = "hello";
    // we cannot do this:
    // str[0]='H';   why?
    // but we must get a mutable reference before
    char[] s = str.dup;
    s[0] = 'H';
    assertEquals(s, FILL_IN_THIS_STRING);
  }

  @Test void stringLiterals()
  {
    auto str1 = `c:\nurten`;    //  \n is not getting interpreted as newline
    auto str2 = r"c:\nurten";   //  same here
    assertEquals(str1, FILL_IN_THIS_STRING);
    assertEquals(str2, FILL_IN_THIS_STRING);
  }

  @Test void unicodeLiterals()
  {
    string s = "résumé"c; // same as "résumé"
    wstring w = "résumé"w;
    dstring d = "résumé"d;

    assertEquals(s.length, FILL_IN_THIS_NUMBER);
    assertEquals(w.length, FILL_IN_THIS_NUMBER);
    assertEquals(d.length, FILL_IN_THIS_NUMBER);
  }
}
