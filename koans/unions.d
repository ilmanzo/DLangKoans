module koans.unions;

import koans.helpers;

//union definition
union IpAddressV4
{
    ubyte[4] bytes;
    uint value;
}

unittest  // union_size()
{
    const auto sz = IpAddressV4.sizeof;
    assert(sz == FILL_IN_THIS_NUMBER);
}

unittest  // union_assignment()
{
    const auto ip = IpAddressV4([127, 0, 0, 1]);
    assert(ip.value == FILL_IN_THIS_NUMBER);
}
