#include <v1model.p4>

header h_t {
  bit<8> f;
}

struct my_packet {
  h_t h;
}

struct my_metadata {

}

parser MyParser(packet_in b, out my_packet p, inout my_metadata m, inout standard_metadata_t s) {
  state start {
    transition accept;
  }
}

control MyVerifyChecksum(in my_packet hdr, inout my_metadata meta) {
  apply { }
}

control MyIngress(inout my_packet p, inout my_metadata m, inout standard_metadata_t s) {
  apply { 
    bit<1> b = (bit<1>) { 0 };
  }
}

control MyEgress(inout my_packet p, inout my_metadata m, inout standard_metadata_t s) {
  apply { }
}

control MyComputeChecksum(inout my_packet p, inout my_metadata m) {
  apply { }
}

control MyDeparser(packet_out b, in my_packet p) {
  apply { }
}

/* Instantiate */
MyParser() p;
MyVerifyChecksum() vck;
MyIngress() i;
MyEgress() e;
MyComputeChecksum() cck;
MyDeparser() dp;

V1Switch(p, vck, i, e, cck, dp) main;
