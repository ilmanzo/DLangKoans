module learn;

import core.runtime;
import std.stdio;
import std.conv;
import std.algorithm : startsWith;
import koans;
static import core.exception;

shared static this()
{
    // Override the default unit test runner to do nothing. After that, "main" will
    // be called.
    Runtime.moduleUnitTester = { return true; };
}

void main()
{
    writeln("Starting your journey to enlightenment...");
    writeln("You will be asked to fill in the blanks in the koans.");
    writeln("Ensure to run 'dub --build=unittest' to run the tests.");
    static foreach (m; koans.koansModules)
    {
        mixin("static import koans." ~ m ~ ";");
        foreach (t; __traits(getUnitTests, mixin("koans." ~ m)))
        {
            try
            {
                t();
            }
            catch (core.exception.AssertError e)
            {
                writeln("Meditate more on ", e.file, " at line ", e.line);
                return;
            }
        }
    }
    writeln("You have reached the end of your journey");
}
