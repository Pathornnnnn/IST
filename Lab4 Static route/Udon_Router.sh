enable
configure terminal

hostname Phuket

spanning-tree mode pvst

interface GigabitEthernet0/0
 ip address 10.10.51.1 255.255.255.0
 no shutdown

interface GigabitEthernet0/1
 shutdown

interface Serial0/0/1
 ip address 172.18.51.2 255.255.255.0
 no shutdown

router rip
 version 2
 no auto-summary
 network 192.168.51.0
 network 172.18.0.0

line vty 0 4
 login

end
write memory


### static

enable
conf t

hostname Phuket
spanning-tree mode pvst

interface g0/0
 ip address 10.10.51.1 255.255.255.0
 no shutdown

interface g0/1
 shutdown

interface s0/0/1
 ip address 172.18.51.2 255.255.255.0
 no shutdown

no router rip


line vty 0 4
 login

end
wr
