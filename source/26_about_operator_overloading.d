module about_operator_overloading;

import dunit;
import helpers;

class AboutOperatorOverloading {
  mixin UnitTest;

  //Operator overloading is accomplished by rewriting operators 
  // whose operands are class or struct objects into calls to specially named member functions. 
  //No additional syntax is used.

  struct Color {
  	ubyte r,g,b;
  	bool opEquals(Color col) const {
  		return (this.r == col.r) && (this.g==col.g) && (this.b == col.b);
  	}
	
	size_t toHash() const nothrow @safe {
		return r*256*256+g*256+b;
	}
  }

  @Test
  void colorEquality() {
  	const Color green1={r:0, g:200, b:0};
  	const Color red={r:200, g:0, b:0};
  	const Color green2={r:0, g:200, b:0};
  	auto result1=(green1==green2); 	
  	auto result2=(green1==red);
  	assertEquals(result1,FILL_IN_TRUE_OR_FALSE);
	assertEquals(result2,FILL_IN_TRUE_OR_FALSE);
  }

  //TODO show off other operator overloading

}
