module koans.ranges;

import koans.helpers;

unittest  // ranges_are_lazy()
{
    import std.algorithm.iteration : map;
    import std.array : array;

    int counter = 0;
    auto numbers = [1, 2, 3];
    auto mapped = numbers.map!((x)
    {
        counter++;
        return x * 2;
    });

    // The mapping delegate does not run when the range is created
    assert(counter == FILL_IN_THIS_NUMBER);

    // Iterating forces evaluation of elements
    auto result = mapped.array;
    assert(counter == FILL_IN_THIS_NUMBER);
    assert(result == FILL_IN_THIS_ARRAY);
}

unittest  // ufcs_with_ranges()
{
    import std.algorithm.iteration : filter;
    import std.array : array;

    int[] arr = [1, 2, 3, 4];

    // Uniform Function Call Syntax allows chaining functions as methods
    auto chained = arr.filter!(x => x > 1).array;
    auto nested = array(filter!(x => x > 1)(arr));

    assert((chained == nested) == FILL_IN_TRUE_OR_FALSE);
    assert(chained == FILL_IN_THIS_ARRAY);
}

unittest  // take_on_infinite_range()
{
    import std.range : repeat, take;
    import std.array : array;

    // repeat creates an infinite range of identical values
    auto infinite_range = repeat(5);

    // take extracts a finite number of elements from the infinite range
    auto sample = infinite_range.take(3).array;
    assert(sample == FILL_IN_THIS_ARRAY);
}
