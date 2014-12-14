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

   @Test
     void other_operations() {
       int [string] ages = ["bob":20, "joe":30, "dan":40];

       assertEquals(ages.length, FILL_IN_THIS_NUMBER);

       auto age=ages["bob"];
       assertEquals(age, FILL_IN_THIS_NUMBER);

       ages["bob"]=77;
       assertEquals(ages["bob"],FILL_IN_THIS_NUMBER);

       import core.exception: RangeError;
       try 
       {
         age=ages["steven"];
       }
       catch (RangeError e)
       {
         // accessing non existing elements raise an exception
         assertEquals(e.msg,FILL_IN_THIS_STRING);
       }

       ages["steven"]=66;  //new ones can be added
       assertEquals(ages["steven"],FILL_IN_THIS_NUMBER);

       assertEquals(ages.length, FILL_IN_THIS_NUMBER);

       ages.remove("joe");  // you can also remove elements

       assertEquals(ages.length, FILL_IN_THIS_NUMBER);

     }
  
  
}
