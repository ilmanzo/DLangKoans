 
//use this empty template as a start for writing new 'about' entries
module about_alias_this;

import dunit;
import helpers;

class AboutAliasThis {
  mixin UnitTest;

  /* 'alias this' enables automatic type conversions 
  (also known as implicit type conversions) 
  of user-defined types. 
  The value of the member becomes the resulting value of the
  conversion. */

  struct A
  {
  	string name;
    int n;
    alias n this;
  }
 
  struct B
  {
    int foo() { return 1; }
    alias foo this;
  }

  int sum(int a, int b)  // function sum() takes 2 int ..
  {
  	return a+b;
  }

  @Test
  public void type_conversion() {
  	A a={ name: "the A struct", n:11 };
  	B b;
  	auto result=sum(a,b); // but we can pass our struct
  	assertEquals(result,FILL_IN_THIS_NUMBER);  
  }

  @Test
  public void assignment() {
  	A a={ name: "another A struct", n:11 };
  	a=19; // think what does this ... Is it legal ? Why ?
  	assertEquals(a,FILL_IN_THIS_NUMBER);  
  }


}
