module about_basics;

import helpers;
import dunit;

class AboutBasics
{
	mixin UnitTest;
    
      struct k {
        int x;
        float f;
        string s;
      }
    
   @Test 
    void about_basics() {
      assertEquals(true,FILL_IN_TRUE_OR_FALSE,"what is truth ?");
      assertEquals(5 % 2, FILL_IN_THIS_NUMBER);
      assertEquals(5 * 2, FILL_IN_THIS_NUMBER);
      assertEquals(5 ^ 2, FILL_IN_THIS_NUMBER);
  
      //zero values
      int x;
      assertEquals(x,FILL_IN_THIS_NUMBER);
      
      //for all types
      float f;
      assertEquals(f,FILL_IN_THIS_DECIMAL);
  
      k c;  //also composite
      
      assertEquals(c.x,FILL_IN_THIS_NUMBER);
      assertEquals(c.f,FILL_IN_THIS_DECIMAL);
      assertEquals(c.s,FILL_IN_THIS_STRING);
  }
  
  
}