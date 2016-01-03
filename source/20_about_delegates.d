module about_delegates;

import helpers;
import dunit;

class AboutDelegates {
  mixin UnitTest;

// Delegates are function pointers with context information attached.
 int delegate(int) call_me_later;   // a delegate which takes an int and returns an int

  class Foo {
    private int y;
    
    //constructor
    this(int value) {
     y=value;
    }

    int mymethod(int x) {
      return x+y;
    }
  }

  @Test
  public void explicit_delegate() {
  Foo foo = new Foo(3);
  call_me_later = &foo.mymethod;
  auto result=call_me_later(5);      // call mymethod(5)
  assertEquals(result, FILL_IN_THIS_NUMBER);
  }

  // --------------------------------------------------------------------------------
  // delegates are useful as "event receivers". Let's define a simple GUI-like class

  alias ClickHandler=void delegate(Button);

  class Button {

    private ClickHandler[] handlers;

    private int click_counter;  //some button properties
    private string name="UNTITLED";
    private string color="DEFAULT";

    void Click() {  // executes user defined callbacks
                    // giving each callback full access to this "Button" context
      foreach(h; handlers) {
        h(this);
      }
      click_counter++;
    }
    void RegisterHandler(ClickHandler func)
    {
      handlers~=func;
    }

    @property string state() {
     import std.format;
     return format("you clicked %d times the button %s with color %s",click_counter,name,color);
    }

  }

  // now the class user can "attach" event handlers to instances of the class
  // in order to change class default behavior

  @Test
  public void delegates_for_callback() {
    auto b1=new Button();
    auto b2=new Button();
    b1.RegisterHandler( delegate(Button b){b.name="OK";} );
    b2.RegisterHandler( delegate(Button b){b.color="RED";} );
    b2.RegisterHandler( delegate(Button b){b.click_counter--;} );   // can be chained
    b1.Click();
    b1.Click();
    b2.Click();
    b2.Click();
    assertEquals(b1.state,FILL_IN_THIS_STRING);
    assertEquals(b2.state,FILL_IN_THIS_STRING);
  }
  



}
