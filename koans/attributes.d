module koans.attributes;

import koans.helpers;
import std.algorithm : canFind;

// function attributes define guarantees enforced by the compiler

pure int square(int x)
{
    return x * x;
}

unittest  // pure_functions()
{
    auto result = square(5);
    assert(result == FILL_IN_THIS_NUMBER);
    assert([__traits(getFunctionAttributes, square)].canFind("pure") == FILL_IN_TRUE_OR_FALSE);
}

int safeDivide(int a, int b) nothrow
{
    if (b == 0)
    {
        return 0;
    }
    return a / b;
}

unittest  // nothrow_functions()
{
    auto result = safeDivide(10, 2);
    assert(result == FILL_IN_THIS_NUMBER);
    assert([__traits(getFunctionAttributes, safeDivide)].canFind("nothrow") == FILL_IN_TRUE_OR_FALSE);
}

@safe int calculateSum(int[] numbers)
{
    int total = 0;
    foreach (n; numbers)
    {
        total += n;
    }
    return total;
}

unittest  // safe_functions()
{
    auto sum = calculateSum([1, 2, 3, 4]);
    assert(sum == FILL_IN_THIS_NUMBER);
    assert([__traits(getFunctionAttributes, calculateSum)].canFind("@safe") == FILL_IN_TRUE_OR_FALSE);
}
