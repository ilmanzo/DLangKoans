module about_classes;

import dunit;
import helpers;

class A {
  private int myValue;  // not accessible from outside

  this (int startValue) { // constructor
    myValue = startValue;
  }

}

class B: A {
  this() {
    super(3);   // what happens here ?
  }

  auto getDoubleValue() {
    return myValue * 2;  // B doesn't have this field but..
  }
}

class AboutClasses {
  mixin UnitTest;

  @Test
  public void inheritance() {
      auto instance = new B;
      assertEquals(instance.getDoubleValue(), FILL_IN_THIS_NUMBER);
  }
}
