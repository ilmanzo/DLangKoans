module koans.scope_guards;

import koans.helpers;

// scope guards execute statements when leaving the current scope

unittest  // scope_exit_runs_always()
{
    string log = "";
    void doWork(bool shouldThrow)
    {
        scope(exit) log ~= "exit;";
        log ~= "start;";
        if (shouldThrow)
        {
            throw new Exception("error");
        }
        log ~= "end;";
    }

    doWork(false);
    assert(log == FILL_IN_THIS_STRING);

    log = "";
    try
    {
        doWork(true);
    }
    catch (Exception e)
    {
        log ~= "caught;";
    }
    assert(log == FILL_IN_THIS_STRING);
}

unittest  // scope_success_and_failure()
{
    string log = "";
    void process(bool shouldThrow)
    {
        scope(success) log ~= "success;";
        scope(failure) log ~= "failure;";
        scope(exit) log ~= "exit;";
        if (shouldThrow)
        {
            throw new Exception("fail");
        }
    }

    process(false);
    assert(log == FILL_IN_THIS_STRING);

    log = "";
    try
    {
        process(true);
    }
    catch (Exception e)
    {
        log ~= "handled;";
    }
    assert(log == FILL_IN_THIS_STRING);
}

unittest  // scope_guards_run_in_reverse_order()
{
    int counter = 1;
    {
        scope(exit) counter *= 2;
        scope(exit) counter += 10;
        counter += 3;
    }
    assert(counter == FILL_IN_THIS_NUMBER);
}
