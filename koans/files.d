module koans.files;

import koans.helpers;

// fill in the value replacing the underscore

immutable auto FILENAME = "just_a_test.txt";

void createTestFile()
{
    import std.stdio : File; //notice the local import
    auto testfile = File(FILENAME, "w");
    testfile.writeln("some data");
} //file is closed when File object goes out of scope

void removeTestFile()
{
    import std.file : remove; //notice the local import
    remove(FILENAME);
}

unittest  // readFile()
{
    import std.stdio : File;
    import std.string : strip;

    createTestFile;
    scope (exit) removeTestFile; // runs even if an assert below fails
    auto myfile = File(FILENAME, "r");
    auto data = strip(myfile.readln());
    assert(data == FILL_IN_THIS_STRING);
}
