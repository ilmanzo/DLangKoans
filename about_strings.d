module about_strings;

import helpers;
import dunit;


class AboutStrings
{
	mixin UnitTest;

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