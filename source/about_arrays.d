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
	  int [5] b=1;   // 5 elements with same value 1
      assertEquals(b,FILL_IN_THIS_ARRAY);
  }

   @Test 
    void dynamic_length_arrays() {
      string[] fruits=["banana","mango"];
	  assertEquals(fruits.length,FILL_IN_THIS_NUMBER);
	  fruits~="strawberry";
	  assertEquals(fruits.length,FILL_IN_THIS_NUMBER);
	  assertEquals(fruits[2],FILL_IN_THIS_STRING);
  }

 
  @Test
  void array_slicing() {
	  int[] a = [4,3,2,1];
	  a[0..2] = [1,2];
	  assertEquals(a,FILL_IN_THIS_ARRAY);
	  a[0..$]=[0,0,0,0]; // $ is always the last element
	  assertEquals(a,FILL_IN_THIS_ARRAY);
  }

  @Test
  void array_append() {
	  int [] a;
	  a.length=3;    // length extended, elements using default value
	  assertEquals(a,FILL_IN_THIS_ARRAY);
	  a ~= [ 3, 4 ];
	  assertEquals(a,FILL_IN_THIS_ARRAY); 
  }
  
}
