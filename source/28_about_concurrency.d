module about_concurrency;

import dunit;
import helpers;

import std.concurrency;
import core.thread;

//this function will run in another thread
//also showing simple message passing
void worker2xFunc(Tid tid)
{
    int value = 0;
    while (value >= 0)
    {
        value = receiveOnly!int();
        auto result = value * 2;
        tid.send(result);
    }
}

//this function will run in another thread
//also showing message passing with wait and timeout
void workerSlowFunc(Tid tid)
{
    //tid.send("starting...");
    Thread.sleep(dur!("msecs")(500),);
    tid.send("done!");
}

class AboutConcurrency
{
    mixin UnitTest;

    @Test void collect_doubles()
    {
        Tid worker = spawn(&worker2xFunc, thisTid);
        int sum = 0;
        foreach (value; 1 .. 3)
        {
            worker.send(value);
            auto result = receiveOnly!int();
            sum += result;
        }
        worker.send(-1); //signal worker to end 
        assertEquals(sum, FILL_IN_THIS_NUMBER);
    }

    @Test void wait_for_result()
    {
        Tid worker = spawn(&workerSlowFunc, thisTid);
        bool received = false;
        while (!received)
        {
            received = receiveTimeout(dur!("msecs")(100), (string message) {
                assertEquals(message,FILL_IN_THIS_STRING);
            });

            if (!received) {
                import std.stdio : write;
                write(".");
            }

        }

    }

}
