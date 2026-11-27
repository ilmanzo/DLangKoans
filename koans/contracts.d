module koans.contracts;

import koans.helpers;
static import core.exception;

// Contracts allow defining pre-conditions (in) and post-conditions (out) for functions.
// They document and enforce expectations at runtime.

int safeDivide(int a, int b)
in
{
    assert(b != 0, "divisor cannot be zero");
}
out (result)
{
    assert(result * b <= a);
}
do
{
    return a / b;
}

unittest  // calling_function_with_contracts()
{
    // Preconditions and postconditions execute automatically on valid calls
    auto result = safeDivide(14, 3);
    assert(result == FILL_IN_THIS_NUMBER);
}

unittest  // in_contract_throws_assert_error()
{
    // When an in-contract fails, an AssertError is thrown
    size_t errorLine = 0;
    try
    {
        safeDivide(10, 0);
    }
    catch (core.exception.AssertError e)
    {
        errorLine = e.line;
    }

    assert(errorLine == FILL_IN_THIS_NUMBER);
}

unittest  // assert_thrown_on_contract_failure()
{
    import std.exception : assertThrown;

    // std.exception.assertThrown can verify that an AssertError is thrown
    assertThrown!(core.exception.AssertError)(safeDivide(10, FILL_IN_THIS_NUMBER));
}
