module koan01;

import helpers;
import dunit;

class Koan01
{
	mixin UnitTest;


	// fill in the value replacing the underscore

	@Test
		public void IntegersEqual()
		{
			auto integer=1;
			auto expected=__;
			assertEquals(expected,integer);
		}

	@Test
		public void IntegersHaveSize()
		{

			int an_integer=1;
			assertEquals(int.sizeof,__);
			assertEquals(an_integer.sizeof,__);
		}

	//hint: here you may want to use assertLessThan
	@Test
		public void IntegersCanBeNegative()
		{
			int an_integer=-42;
			assertEquals(an_integer,0);
		}


}

