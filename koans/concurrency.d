module koans.concurrency;

import koans.helpers;

import std.concurrency;
import core.thread;
import std.stdio : write;

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

unittest  // collect_doubles()
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
    assert(sum == FILL_IN_THIS_NUMBER);
}

unittest  // wait_for_result()
{
    Tid _ = spawn(&workerSlowFunc, thisTid);
    bool received = false;
    while (!received)
    {
        received = receiveTimeout(dur!("msecs")(100), (string message) {
            assert(message == FILL_IN_THIS_STRING);
        });
        if (!received)
            write(".");
    }
}
