module about_arrays;

import helpers;
import dunit;

class AboutArrays
{
	mixin UnitTest;
	
   
  @Test
   void fixed_length_arrays() {
     string[4] fruits=["banana","mango","apple","orange"];
	  assertEquals(fruits[0],FILL_IN_THIS_STRING);
	  assertEquals(fruits.length,FILL_IN_THIS_NUMBER);
  }

   @Test 
    void dynamic_length_arrays() {
      string[] fruits=["banana","mango"];
	  assertEquals(fruits.length,FILL_IN_THIS_NUMBER);
	  fruits~="strawberry";
	  assertEquals(fruits.length,FILL_IN_THIS_NUMBER);
	  assertEquals(fruits[2],FILL_IN_THIS_STRING);
  }

  
  
}
