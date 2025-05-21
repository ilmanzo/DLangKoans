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
} //file is closed when File object goes out of scope

unittest  // readFile()
{
    import std.stdio : File;
    import std.string : strip;

    createTestFile;
    auto myfile = File(FILENAME, "r");
    auto data = strip(myfile.readln());
    auto expected = FILL_IN_THIS_STRING;
    assert(expected, data);
    removeTestFile;
}
