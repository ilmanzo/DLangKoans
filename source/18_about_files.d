module about_files;

import dunit;
import helpers;

class AboutFiles {
  mixin UnitTest;

  // fill in the value replacing the underscore

  private immutable auto FILENAME="just_a_test.txt";

  @BeforeEach
  public void createTestFile() {
    import std.stdio : File; //notice the local import
    auto testfile = File(FILENAME, "w");
    testfile.writeln("some data");
  } //file is closed when File object goes out of scope

  @AfterEach
  public void removeTestFile() {
    import std.file : remove; //notice the local import
    remove(FILENAME);
  } //file is closed when File object goes out of scope

  @Test
  public void readFile() {
    import std.stdio : File;
    import std.string : strip;
    auto myfile=File(FILENAME,"r");
    auto data=strip(myfile.readln());
    auto expected = FILL_IN_THIS_STRING;
    assertEquals(expected, data);
  }

}
