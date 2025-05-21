module koans.chars;

import koans.helpers;

unittest  // lonely_char()
{
    char a_character = 'a';
    assert(a_character == FILL_IN_THIS_CHAR);
    //assert(a_character == 'b');
}

unittest  // chars_have_a_size()
{
    char a_character = 'b';
    assert(a_character.sizeof == 3, "chars have a size");
}

unittest  // chars_are_numbers()
{
    char a_character = 'A';
    assert(cast(int)(a_character) == FILL_IN_THIS_NUMBER);
}

unittest  // more_chars_are_a_string()
{
    string some_characters = "Hello World";
    assert(some_characters.length == FILL_IN_THIS_NUMBER);
}

unittest  // unicode_chars()
{
    char e1 = 'e';
    wchar e2 = 'è';
    dchar e3 = 'é';
    assert(e1.sizeof == FILL_IN_THIS_NUMBER);
    assert(e2.sizeof == FILL_IN_THIS_NUMBER);
    assert(e3.sizeof == FILL_IN_THIS_NUMBER);
}
