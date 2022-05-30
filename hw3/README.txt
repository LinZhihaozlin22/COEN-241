=========== Task 1 ===============
Q1.
available nodes are: 
c0 h1 h2 h3 h4 h5 h6 h7 h8 s1 s2 s3 s4 s5 s6 s7
mininet> net
h1 h1-eth0:s3-eth2
h2 h2-eth0:s3-eth3
h3 h3-eth0:s4-eth2
h4 h4-eth0:s4-eth3
h5 h5-eth0:s6-eth2
h6 h6-eth0:s6-eth3
h7 h7-eth0:s7-eth2
h8 h8-eth0:s7-eth3
s1 lo:  s1-eth1:s2-eth1 s1-eth2:s5-eth1
s2 lo:  s2-eth1:s1-eth1 s2-eth2:s3-eth1 s2-eth3:s4-eth1
s3 lo:  s3-eth1:s2-eth2 s3-eth2:h1-eth0 s3-eth3:h2-eth0
s4 lo:  s4-eth1:s2-eth3 s4-eth2:h3-eth0 s4-eth3:h4-eth0
s5 lo:  s5-eth1:s1-eth2 s5-eth2:s6-eth1 s5-eth3:s7-eth1
s6 lo:  s6-eth1:s5-eth2 s6-eth2:h5-eth0 s6-eth3:h6-eth0
s7 lo:  s7-eth1:s5-eth3 s7-eth2:h7-eth0 s7-eth3:h8-eth0
c0

Q2.
h7-eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 10.0.0.7  netmask 255.0.0.0  broadcast 10.255.255.255
        inet6 fe80::28ed:3eff:fe4e:acee  prefixlen 64  scopeid 0x20<link>
        ether 2a:ed:3e:4e:ac:ee  txqueuelen 1000  (Ethernet)
        RX packets 41  bytes 2870 (2.8 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 13  bytes 1006 (1.0 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0


=========== Task 2 ===============
Q1.
_handle_PacketIn() -> act_like_hub() -> resend_packet()

Q2.
a. "h1 ping h2" Avg: 19.316 ms | "h1 ping h8" Avg: 64.003 ms
b. "h1 ping h2" Min: 13.560 ms, Max: 68.273 ms | "h1 ping h8" Min: 58.657 ms, Max: 115.207 ms
c. "h1 ping h2" is faster than "h1 ping h8". It is because there are less switches and hops between h1 and h2 comparing to h1 and h8. 

Q3.
a. iperf is used to measure network performance and tuning. It tests TCP bandwidth.
b. "iperf h1 h2" results: ['194 Kbits/sec', '615 Kbits/sec'] | "iperf h1 h8" results: ['170 Kbits/sec', '603 Kbits/sec']
c. "iperf h1 h2" is slightly better than "iperf h1 h8". It may due to that it has shorter route between h1 and h2, and it has quicker return time. There is also many other factors that may affect the bandwidth.

Q4.
I tested with "h1 h2" & "h1 h8". All switches got traffic. In "h1 h2", s3 observed traffic. In "h1 h8", s1, s2, s3, s5, s7 observed traffic. The way for observing is that I added a print statement inside _handle_PacketIn function to print the switch and packet's source & destination.


=========== Task 3 ===============
Q1.
The code is working as following:
Every time when a new source arrive at a switch and if it is not in map, it will inserts it into the map with packet.src as key and port as value. After that, it will check if destination is in the map. If the destination is in the map, it will send the packet directly to the port associate with it using resend_packet() function. If the destination is not in the map, it will flood the packet to all ports except the input port.

Q2.
a. "h1 ping h2" Avg: 16.873 ms | "h1 ping h8" Avg: 57.247 ms
b. "h1 ping h2" Min: 9.390 ms, Max: 39.656 ms | "h1 ping h8" Min: 46.552 ms, Max: 103.904 ms
c. The difference is that the results in task 3 are better than results in task 2. The avg/min/max ping are all decreased. it is due to the map that could learn and improve the performance. Every time the map will learn and store the information, and use it to expedite the process.

Q3.
a. "iperf h1 h2" results: ['3.66 Mbits/sec', '4.46 Mbits/sec'] | "iperf h1 h8" results: ['839 Kbits/sec', '1.26 Mbits/sec']
b. 
Overall, the throughputs of task 3 increase and are better than the throughputs of tasks 2. It is due to the same reason of Q2, and it is more efficient when using the map to learn instead of flood packets to the network.


