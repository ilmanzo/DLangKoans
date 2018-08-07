module about_tuples;

import dunit;
import helpers;


// Tuples are for combining multiple values to be used as a single object. They are like structs but easier to use.

// relevant chapter from the online book: http://ddili.org/ders/d.en/tuples.html


import std.typecons;

class AboutTuples {
  mixin UnitTest;

  @Test
  void construct_tuple_simple() {
      auto mytuple = tuple(13, "bananas");
      assertEquals(mytuple[0],FILL_IN_THIS_NUMBER); // tuples element can be accessed by index
      assertEquals(mytuple[1],FILL_IN_THIS_STRING); // tuples element can be accessed by index
  }

  @Test
  void construct_tuple_template() {
      // if you build the tuple using the template Tuple!() you can access elements by name
      auto mytuple = Tuple!(int,"number",string, "fruitname")(13,"bananas");
      assertEquals(mytuple.fruitname,FILL_IN_THIS_STRING); // tuples element can be accessed by index
  }

  @Test
  // expand or slicing a tuple converts it in a list of objects. THIS IS DONE AT COMPILE TIME!
  void tuples_can_be_expanded() {
      auto coords = Tuple!(float,"x",float,"y",float,"z")(1.5,2.6,3.4);
      auto array=[coords.expand, coords[]]; //array of floats declaration and initialization
      assertEquals(array.length,FILL_IN_THIS_NUMBER);
  }



}
