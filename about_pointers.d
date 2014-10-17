module about_pointers;

import helpers;
import dunit;


class AboutPointers
{
  
  mixin UnitTest;
  @Test
  public void pointerDereference()
  {
    int a=3;
    int *p=&a;
    *p=4;
    assertEquals(a,FILL_IN_THIS_NUMBER);
  }
  
}