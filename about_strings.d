module about_strings;

import helpers;
import dunit;

class AboutStrings
{
    mixin UnitTest;
	
	@Test
	public void stringSlicing()
	{
	  auto sentence="The quick brown fox";
	  assertEquals(sentence[0],FILL_IN_THIS_CHAR);
	  assertEquals(sentence[1..3],FILL_IN_THIS_STRING);
	  assertEquals(sentence[$],FILL_IN_THIS_CHAR);
	  assertEquals(sentence[$-3..$],FILL_IN_THIS_STRING);
	}

    @Test
    public void unicodeLiterals()
    {
	  string s = "résumé"c;   // same as "résumé"
      wstring w = "résumé"w;
      dstring d = "résumé"d;

      assertEquals(s.length,FILL_IN_THIS_NUMBER);
      assertEquals(w.length,FILL_IN_THIS_NUMBER);
      assertEquals(d.length,FILL_IN_THIS_NUMBER);
    }

}