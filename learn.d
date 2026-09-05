module learn;

import core.runtime;
import std.stdio;
import koans;
static import core.exception;

shared static this()
{
    // Override the default unit test runner to do nothing. 
    // After that, "main" will be called.
    Runtime.moduleUnitTester = { return true; };
}

void printPrettyFailure(string file, size_t line)
{
    import std.file : exists, readText;
    import std.string : splitLines, strip, indexOf;
    import std.algorithm : min;

    writeln("\n\x1b[1;31m━━━━━━━━━━━━━━━━━━━━━ MEDITATION REQUIRED ━━━━━━━━━━━━━━━━━━━━━\x1b[0m");
    writeln("  \x1b[1;33m📍 Location:\x1b[0m ", file, " at line \x1b[1m", line, "\x1b[0m");
    writeln("\x1b[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\x1b[0m");

    if (!exists(file)) return;

    try
    {
        auto content = readText(file);
        auto lines = content.splitLines();
        if (line > 0 && line <= lines.length)
        {
            size_t start = (line > 3) ? line - 3 : 0;
            size_t end = min(lines.length, line + 2);

            foreach (i; start .. end)
            {
                size_t currentLineNum = i + 1;
                if (currentLineNum == line)
                {
                    // Print failing line in red with a marker
                    writeln(
                        " \x1b[1;31m▶\x1b[0m \x1b[1;31m", currentLineNum, "\x1b[0m │ \x1b[1;31m", lines[i], "\x1b[0m"
                    );
                    
                    // Add a small arrow pointing at the placeholder if we find one
                    ptrdiff_t fillIdx = lines[i].indexOf("FILL_IN_");
                    if (fillIdx != -1)
                    {
                        // construct spaces for alignment
                        write("     │ ");
                        foreach (k; 0 .. fillIdx) write(" ");
                        writeln("\x1b[1;33m▲─── Fill in this blank\x1b[0m");
                    }
                }
                else
                {
                    // Print context lines
                    writeln("   \x1b[38;5;244m", currentLineNum, "\x1b[0m │ \x1b[38;5;244m", lines[i], "\x1b[0m");
                }
            }
        }
    }
    catch (Exception)
    {
        // Fallback to basic message if file reading fails
    }
    writeln("\x1b[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\x1b[0m\n");
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
                printPrettyFailure(e.file, e.line);
                return;
            }
        }
    }
    writeln("\x1b[1;32m🎉 Congratulations! You have reached the end of your journey and attained enlightenment! 🎉\x1b[0m");
}
