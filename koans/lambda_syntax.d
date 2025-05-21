module koans.lambda_syntax;

import koans.helpers;

// the new "lambda" (anonymous function) syntax was introduced in DMD 2.058

import std.algorithm : filter;
import std.array : array;

bool myfunc(int number)
{
    return number < 20;
}

unittest  // try_lambda_syntax()
{
    const int[] numbers = [20, 1, 10, 300, -2];

    // filter returns all the values where the given function is true

    //showing the "old" way , passing a pre-defined function
    auto filtered_with_defined_func = numbers.filter!(myfunc);

    // we can instead pass an anonymous function
    auto filtered_with_anon_func = numbers.filter!(function bool(x) {
        return x < 20;
    });
    // 'function' keyword is not necessary, so 
    // 'bool(x) { return x < 20; }' 
    // also works; the return type can be inferred, so the above can be written as
    // auto filtered_with_anon_func=numbers.filter!( x { return x < 20;  });

    // and now let's replace the return and curly braces with the "new" lambda syntax
    auto filtered_with_lambda = numbers.filter!(n => n < 20);
    assert(filtered_with_defined_func.array == filtered_with_anon_func.array); // converted to array,
    assert(filtered_with_defined_func.array == filtered_with_lambda.array); // results are the same

    assert(filtered_with_lambda.array.length == FILL_IN_THIS_NUMBER);
}
