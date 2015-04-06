module about_structs;

import helpers;
import dunit;

//struct defines a type, not a variable
struct TimeOfDay {
  int hour;
  int minute;
}

struct Student {
  int number;
  int []grades;
}

class AboutStructs {
  mixin UnitTest;

  @Test
    public void structs_can_be_initialized() {
      auto t1 = TimeOfDay(8, 30);  // preferred syntax
      assertEquals(t1.minute, FILL_IN_THIS_NUMBER);
      TimeOfDay t2 = {9, 45};      // alternate C syntax
      assertEquals(t2.hour, FILL_IN_THIS_NUMBER);
      auto t3 = TimeOfDay(10);     // not all members need to be specified
      assertEquals(t3.minute, FILL_IN_THIS_NUMBER);
    }


  @Test
    public void structs_members_are_copied() {
      auto student1 = Student(1,[70,90,85]);
      auto student2 = student1;
      student2.number = 2;
      assertEquals(student2.grades, FILL_IN_THIS_ARRAY);
    }
}
