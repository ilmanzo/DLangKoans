module koans.operator_overloading;

import koans.helpers;

//Operator overloading is accomplished by rewriting operators 
// whose operands are class or struct objects into calls to specially named member functions. 
//No additional syntax is used.

struct Color
{
    ubyte r, g, b;
    bool opEquals(Color col) const
    {
        return (this.r == col.r) && (this.g == col.g) && (this.b == col.b);
    }

    size_t toHash() const nothrow @safe
    {
        return r * 256 * 256 + g * 256 + b;
    }
}

unittest  // colorEquality()
{
    const Color green1 = {r: 0, g: 200, b: 0};
    const Color red = {r: 200, g: 0, b: 0};
    const Color green2 = {r: 0, g: 200, b: 0};
    auto result1 = (green1 == green2);
    auto result2 = (green1 == red);
    assert(result1 == FILL_IN_TRUE_OR_FALSE);
    assert(result2 == FILL_IN_TRUE_OR_FALSE);
}

struct Vector2
{
    int x, y;

    Vector2 opBinary(string op : "+")(const Vector2 rhs) const
    {
        return Vector2(this.x + rhs.x, this.y + rhs.y);
    }

    int opIndex(size_t index) const
    {
        if (index == 0)
            return x;
        if (index == 1)
            return y;
        assert(0, "Index out of bounds");
    }
}

unittest  // binary_operator_overloading()
{
    // Binary operators like + are overloaded via opBinary template
    const a = Vector2(2, 3);
    const b = Vector2(4, 5);
    const result = a + b;
    assert(result.x == FILL_IN_THIS_NUMBER);
    assert(result.y == FILL_IN_THIS_NUMBER);
}

struct Priority
{
    int level;

    int opCmp(const Priority rhs) const
    {
        if (this.level < rhs.level)
            return -1;
        if (this.level > rhs.level)
            return 1;
        return 0;
    }
}

unittest  // comparison_operator_overloading()
{
    // Comparison operators (<, <=, >, >=) are overloaded via opCmp
    const low = Priority(1);
    const high = Priority(10);
    auto result = (low < high);
    assert(result == FILL_IN_TRUE_OR_FALSE);
}

unittest  // index_operator_overloading()
{
    // Array indexing syntax is overloaded via opIndex
    const v = Vector2(7, 9);
    assert(v[0] == FILL_IN_THIS_NUMBER);
    assert(v[1] == FILL_IN_THIS_NUMBER);
}
