module about_files;

import helpers;
import dunit;

class AboutFiles {
  mixin UnitTest;

  // fill in the value replacing the underscore

  private immutable auto FILENAME="just_a_test.txt";

  private void CreateTestFile() {
    import std.stdio; //notice the local import
    auto testfile = File(FILENAME, "w");
    testfile.writeln("some data");
  } //file is closed when File object goes out of scope


  @Test
  public void ReadFile() {
    import std.stdio;
    import std.string;
    CreateTestFile();
    auto myfile=File(FILENAME,"r");
    auto data=strip(myfile.readln());
    auto expected = FILL_IN_THIS_STRING;
    assertEquals(expected, data);
  }

}
