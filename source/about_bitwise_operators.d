module about_bitwise_operators;

import helpers;
import dunit;

class AboutBitwiseOperators
{
	mixin UnitTest;

	@Test
		public void shifts()
		{
			auto i=1;
            auto j=-8;
			assertEquals(j<<3, FILL_IN_THIS_NUMBER);
			assertEquals(j>>>3, FILL_IN_THIS_NUMBER);
			assertEquals(j>>3, FILL_IN_THIS_NUMBER);
			assertEquals(i<<3, FILL_IN_THIS_NUMBER);
		}

}
