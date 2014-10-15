module about_chars;

import helpers;
import dunit;

class AboutChars
{
	mixin UnitTest;

	@Test
		public void lonely_char()
		{
			char a_character = 'a';
			assertEquals(a_character, FILL_IN_THIS_CHAR);
		}
}