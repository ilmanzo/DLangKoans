module koans.classes;

import koans.helpers;

class A
{
    private int myValue; // not accessible from outside

    this(int startValue)
    { // constructor
        myValue = startValue;
    }

}

class B : A
{
    this()
    {
        super(3); // what happens here ?
    }

    auto getDoubleValue()
    {
        return myValue * 2; // B doesn't have this field but..
    }
}

unittest  // inheritance()
{
    auto instance = new B;
    assert(instance.getDoubleValue() == FILL_IN_THIS_NUMBER);
}

// code preparation for next test
struct TimeOfDay_s
{
    int hour;
    int minute;
}

class TimeOfDay_c
{
    int hour;
    int minute;
}

void set_time(TimeOfDay_c tc, int hour, int min)
{
    tc.hour = hour;
    tc.minute = min;
}

void set_time(TimeOfDay_s ts, int hour, int min)
{
    ts.hour = hour;
    ts.minute = min;
}

unittest  // class_vs_struct()
{
    TimeOfDay_s timestruct; // memory allocated on the stack
    TimeOfDay_c timeclass;
    // here timeclass it's a null pointer!
    // must allocate space and initialize fields...
    timeclass = new TimeOfDay_c; // object is created on the heap
    set_time(timestruct, 15, 10);
    set_time(timeclass, 15, 10);

    assert(timestruct.hour == FILL_IN_THIS_NUMBER); //surprised ?
    assert(timeclass.hour == FILL_IN_THIS_NUMBER); //classes are reference type
}
