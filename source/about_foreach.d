module about_foreach;

import helpers;
import dunit;

class AboutForeach
{
	mixin UnitTest;

	@Test
		public void arrays_iteration()
		{
			auto array=[3,4,5,6];
			foreach(x ; array)  // simple iteration , what is the scope of 'x'?
			{
				x=x*2;
			}
			assertEquals(array[0],FILL_IN_THIS_NUMBER);
			foreach(ref x ; array)  // what is changed ?
			{
				x=x*2;
			}
			assertEquals(array[0],FILL_IN_THIS_NUMBER);
		}

	@Test
		public void strings_iteration()  // in D, string are arrays of chars
		{
		}

	@Test
		public void foreach_with_associative_arrays()
		{
		}


}

