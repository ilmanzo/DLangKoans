module about_associative_arrays;

import helpers;
import dunit;

class AboutAssociativeArrays
{
	mixin UnitTest;
    
   @Test 
    void creation_and_assignment() {
      int [string] mymap;
      mymap["hello"]=3;
      assertEquals(mymap["hello"],FILL_IN_THIS_NUMBER);
  }
  
  
}
