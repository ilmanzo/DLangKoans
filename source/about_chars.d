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

	@Test
		public void chars_have_a_size()
		{
			char a_character = 'b';
			assertEquals(a_character.sizeof,FILL_IN_THIS_CHAR);
		}

	@Test 
		public void chars_are_numbers()
		{
			char a_character = 'A';
			assertEquals(cast(int)(a_character),FILL_IN_THIS_NUMBER);
		}


	@Test
		public void more_chars_are_a_string()
		{
			string some_characters = "Hello World";
			assertEquals(some_characters.length ,FILL_IN_THIS_NUMBER);
		}


}
