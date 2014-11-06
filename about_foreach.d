module about_foreach;

import helpers;
import dunit;

class AboutForeach
{
    mixin UnitTest;

	@Test
	public void foreachsyntax()
	{

    auto array=[3,4,5,6];
    foreach(x ; array)  // simple iteration , what is the scope of 'x'?
    {
      x=x*2;
    }
    assertEquals(array[0],FILL_IN_THIS_NUMBER);
    foreach(i,x ; array)  // simple iteration , what is the scope of 'i'?
    {
      array[i]=x*2;
    }
    assertEquals(array[0],FILL_IN_THIS_NUMBER);

	}


}
