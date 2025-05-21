module koans.strings;

import koans.helpers;

unittest  // stringSlicing
{
    auto sentence = "The quick brown fox";
    assert(sentence[0] == FILL_IN_THIS_CHAR);
    assert(sentence[1 .. 3] == FILL_IN_THIS_STRING);
    assert(sentence[$ - 1] == FILL_IN_THIS_CHAR);
    assert(sentence[$ - 3 .. $] == FILL_IN_THIS_STRING);
}

unittest  // stringConcatenation()
{
    auto str1 = "Hello";
    auto str2 = " World";
    auto str = str1 ~ str2;
    assert(str == FILL_IN_THIS_STRING);
}

unittest  // stringsAreImmutable()
{
    auto str = "hello";
    // we cannot do this:
    // str[0]='H';   why?
    // but we must get a mutable reference before
    char[] s = str.dup;
    s[0] = 'H';
    assert(s == FILL_IN_THIS_STRING);
}

unittest  // stringLiterals()
{
    auto str1 = `c:\nurten`; //  \n is not getting interpreted as newline
    auto str2 = r"c:\nurten"; //  same here
    assert(str1 == FILL_IN_THIS_STRING);
    assert(str2 == FILL_IN_THIS_STRING);
}

unittest  // unicodeLiterals()
{
    string s = "résumé"c; // same as "résumé"
    wstring w = "résumé"w;
    dstring d = "résumé"d;

    assert(s.length == FILL_IN_THIS_NUMBER);
    assert(w.length == FILL_IN_THIS_NUMBER);
    assert(d.length == FILL_IN_THIS_NUMBER);
}
