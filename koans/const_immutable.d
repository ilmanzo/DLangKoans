module koans.const_immutable;

import koans.helpers;

int get_first_element(const int[] items)
{
    return items[0];
}

unittest  // typeof_checks()
{
    int mutable_var = 1;
    const int const_var = 2;
    immutable int immutable_var = 3;

    // Type introspection via is(typeof(...) == ...) determines qualifiers at compile time
    assert(is(typeof(mutable_var) == int) == FILL_IN_TRUE_OR_FALSE);
    assert(is(typeof(const_var) == const(int)) == FILL_IN_TRUE_OR_FALSE);
    assert(is(typeof(immutable_var) == immutable(int)) == FILL_IN_TRUE_OR_FALSE);
}

unittest  // const_reference_binding()
{
    int mutable_val = 10;
    immutable int immutable_val = 20;

    // A const reference can be bound to both mutable and immutable data
    const(int)* ref_mutable = &mutable_val;
    const(int)* ref_immutable = &immutable_val;

    assert(*ref_mutable == FILL_IN_THIS_NUMBER);
    assert(*ref_immutable == FILL_IN_THIS_NUMBER);

    // Modifying mutable data changes the value observed through the const reference
    mutable_val = 15;
    assert(*ref_mutable == FILL_IN_THIS_NUMBER);
}

unittest  // immutable_data_cannot_be_modified()
{
    int mutable_val = 10;
    immutable int immutable_val = 20;

    // Mutable variables can be freely updated
    mutable_val = 30;
    assert(mutable_val == FILL_IN_THIS_NUMBER);

    // Immutable data cannot be modified once initialized
    assert(!__traits(compiles, { immutable_val = 50; }) == FILL_IN_TRUE_OR_FALSE);
    assert(immutable_val == FILL_IN_THIS_NUMBER);
}

unittest  // const_parameters_accept_both()
{
    int[] mutable_items = [100, 200];
    immutable int[] immutable_items = [300, 400];

    // Functions with const parameters accept mutable and immutable arguments
    assert(get_first_element(mutable_items) == FILL_IN_THIS_NUMBER);
    assert(get_first_element(immutable_items) == FILL_IN_THIS_NUMBER);
}
