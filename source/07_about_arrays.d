module about_arrays;

import helpers;
import dunit;

class AboutArrays
{
  mixin UnitTest;

  @Test
   void fixed_length_arrays() {
    string[4] fruits = ["banana", "mango", "apple", "orange"];
    assertEquals(fruits[0], FILL_IN_THIS_STRING);
    assertEquals(fruits.length, FILL_IN_THIS_NUMBER);
    int[5] b = 1; // 5 elements with same value 1
    assertEquals(b, FILL_IN_THIS_ARRAY);
  }

  @Test
  void dynamic_length_arrays() {
    string[] fruits = ["banana", "mango"];
    assertEquals(fruits.length, FILL_IN_THIS_NUMBER);
    fruits ~= "strawberry";
    assertEquals(fruits.length, FILL_IN_THIS_NUMBER);
    assertEquals(fruits[2], FILL_IN_THIS_STRING);
  }


  @Test
  void array_slicing() {
    int[] a = [4, 3, 2, 1];
    a[0..2] = [1, 2];
    assertEquals(a, FILL_IN_THIS_ARRAY);
    a[0..$] = [0, 0, 0, 0]; // $ is always the last element
    assertEquals(a, FILL_IN_THIS_ARRAY);
  }

  @Test
  void array_append() {
    int [] a;
    a.length = 3; // length extended, elements using default value
    assertEquals(a, FILL_IN_THIS_ARRAY);
    a ~= [3, 4];
    assertEquals(a, FILL_IN_THIS_ARRAY);
  }

  @Test
  void slices_of_the_same_array() {
    int[] items=[1,1,2,3,5,8,13,21,34,55,89,144];
    auto slice1=items[2..9];
    auto slice2=items[4..7];
    assertEquals(slice1[0],FILL_IN_THIS_NUMBER);
    assertEquals(slice2[0],FILL_IN_THIS_NUMBER);
    slice1[3]=99;
    assertEquals(slice2[1],FILL_IN_THIS_NUMBER);
    slice2.length=2;  //truncating a slice...
    assertEquals(items.length,FILL_IN_THIS_NUMBER); // ... changes original array lenght ?
  }


}
