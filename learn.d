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

void printPrettyFailure(string file, size_t line, string msg = null)
{
    import std.file : exists, readText;
    import std.string : splitLines, indexOf;
    import std.algorithm : min;

    writeln("\n\x1b[1;31m━━━━━━━━━━━━━━━━━━━━━ MEDITATION REQUIRED ━━━━━━━━━━━━━━━━━━━━━\x1b[0m");
    writeln("  \x1b[1;33m📍 Location:\x1b[0m ", file, " at line \x1b[1m", line, "\x1b[0m");
    if (msg.length)
        writeln("  \x1b[1;33m💬 Message:\x1b[0m ", msg);
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

void printProgress(size_t done, size_t total)
{
    writeln("  \x1b[1;33m📈 Koans completed:\x1b[0m ", done, "/", total);
}

void main()
{
    writeln("Starting your journey to enlightenment...");
    writeln("You will be asked to fill in the blanks in the koans.");
    size_t total;
    static foreach (m; koans.koansModules)
        total += __traits(getUnitTests, mixin("koans." ~ m)).length;
    size_t done;
    static foreach (m; koans.koansModules)
    {
        foreach (t; __traits(getUnitTests, mixin("koans." ~ m)))
        {
            try
            {
                t();
                ++done;
            }
            catch (core.exception.AssertError e)
            {
                printPrettyFailure(e.file, e.line, e.msg == "unittest failure" ? null : e.msg);
                printProgress(done, total);
                return;
            }
            catch (Throwable e) // e.g. RangeError, ConvException caused by a learner's edit
            {
                // shortcut: shows where it was thrown (may be inside Phobos), not the koan line; upgrade by scanning e.info for "koans/"
                printPrettyFailure(e.file, e.line, typeid(e).name ~ ": " ~ e.msg);
                printProgress(done, total);
                return;
            }
        }
    }
    printProgress(done, total);
    writeln("\x1b[1;32m🎉 Congratulations! You have reached the end of your journey and attained enlightenment! 🎉\x1b[0m");
}
