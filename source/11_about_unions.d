module about_unions;

import dunit;
import helpers;

//union definition
union IpAddressV4 {
    ubyte[4] bytes;
    uint value;
}


class AboutUnions {
  mixin UnitTest;

  @Test
    public void union_size() {
      const auto sz = IpAddressV4.sizeof;
      assertEquals(sz, FILL_IN_THIS_NUMBER);
    }

  @Test
    public void union_assignment() {
      const auto ip=IpAddressV4([127,0,0,1]);
      assertEquals(ip.value, FILL_IN_THIS_NUMBER);
    }
}
