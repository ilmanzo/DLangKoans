module about_chars;

import dunit;
import helpers;

class AboutChars
{
  mixin UnitTest;

  @Test
  void lonely_char() {
    char a_character = 'a';
    //assertEquals(a_character, FILL_IN_THIS_CHAR);
    assertEquals(a_character, 'b');
  }

  @Test
  void chars_have_a_size() {
    char a_character = 'b';
    assertEquals(a_character.sizeof, 3);
  }

  @Test
  void chars_are_numbers() {
    char a_character = 'A';
    assertEquals(cast(int)(a_character), FILL_IN_THIS_NUMBER);
  }

  @Test
  void more_chars_are_a_string() {
    string some_characters = "Hello World";
    assertEquals(some_characters.length, FILL_IN_THIS_NUMBER);
  }

  @Test
  void unicode_chars() {
    char  e1 = 'e';
    wchar e2 = 'è';
    dchar e3 = 'é';
    assertEquals(e1.sizeof,FILL_IN_THIS_NUMBER);
    assertEquals(e2.sizeof,FILL_IN_THIS_NUMBER);
    assertEquals(e3.sizeof,FILL_IN_THIS_NUMBER);
  }

}
