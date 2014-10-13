//          Copyright Mario Kröplin 2013.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          http://www.boost.org/LICENSE_1_0.txt)

module dunit.color;

import std.stdio;

enum Color { red, green, yellow, onRed, onGreen, onYellow }

version (Posix)
{
    public void writec(Color color, string text)
    {
        if (canUseColor())
        {
            const string CSI = "\x1B[";

            final switch (color) with (Color)
            {
                case red:
                    stdout.write(CSI, "37;31;1m");
                    break;
                case green:
                    stdout.write(CSI, "37;32;1m");
                    break;
                case yellow:
                    stdout.write(CSI, "37;33;1m");
                    break;
                case onRed:
                    stdout.write(CSI, "37;41;1m");
                    break;
                case onGreen:
                    stdout.write(CSI, "37;42;1m");
                    break;
                case onYellow:
                    stdout.write(CSI, "37;43;1m");
                    break;
            }
            stdout.write(text);
            stdout.write(CSI, "0m");
            stdout.flush();
        }
        else
        {
            stdout.write(text);
            stdout.flush();
        }
    }

    private static bool canUseColor()
    {
        static bool useColor = false;
        static bool computed = false;

        if (!computed)
        {
            // disable colors if the output is written to a file or pipe instead of a tty
            import core.sys.posix.unistd;

            useColor = isatty(stdout.fileno()) != 0;
            computed = true;
        }
        return useColor;
    }
}

version (Windows)
{
    public void writec(Color color, string text)
    {
        if (canUseColor())
        {
            import core.sys.windows.windows;

            HANDLE handle = GetStdHandle(STD_OUTPUT_HANDLE);
            CONSOLE_SCREEN_BUFFER_INFO info;

            GetConsoleScreenBufferInfo(handle, &info);
            final switch (color) with (Color)
            {
                case red:
                    SetConsoleTextAttribute(handle,
                            FOREGROUND_RED | FOREGROUND_INTENSITY);
                    break;
                case green:
                    SetConsoleTextAttribute(handle,
                            FOREGROUND_GREEN | FOREGROUND_INTENSITY);
                    break;
                case yellow:
                    SetConsoleTextAttribute(handle,
                            FOREGROUND_RED | FOREGROUND_GREEN | FOREGROUND_INTENSITY);
                    break;
                case onRed:
                    SetConsoleTextAttribute(handle,
                            BACKGROUND_RED | BACKGROUND_INTENSITY);
                    break;
                case onGreen:
                    SetConsoleTextAttribute(handle,
                            BACKGROUND_GREEN | BACKGROUND_INTENSITY);
                    break;
                case onYellow:
                    SetConsoleTextAttribute(handle,
                            BACKGROUND_RED | BACKGROUND_GREEN | BACKGROUND_INTENSITY);
                    break;
            }
            stdout.write(text);
            stdout.flush();
            SetConsoleTextAttribute(handle, info.wAttributes);
        }
        else
        {
            stdout.write(text);
            stdout.flush();
        }
    }

    private static bool canUseColor()
    {
        static bool useColor = false;
        static bool computed = false;

        if (!computed)
        {
            // disable colors if the results output is written to a file or pipe instead of a tty
            import core.sys.windows.windows;

            CONSOLE_SCREEN_BUFFER_INFO info;

            useColor = GetConsoleScreenBufferInfo(GetStdHandle(STD_OUTPUT_HANDLE), &info) > 0;
            computed = true;
        }
        return useColor;
    }
}
