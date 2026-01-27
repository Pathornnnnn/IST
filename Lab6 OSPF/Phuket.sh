hostname Phuket
!
!
!
!
ip dhcp excluded-address 192.168.53.1
ip dhcp excluded-address 192.168.53.255
!
ip dhcp pool LAN-POOL-Z
 network 192.168.53.0 255.255.255.0
 default-router 192.168.53.1
!
!
!
no ip cef
no ipv6 cef
!
!
!
!
!
!
!
!
!
!
!
!
!
!
!
!
!
!
!
!
interface Loopback0
 ip address 10.53.53.1 255.255.255.252
!
interface FastEthernet0/0
 ip address 192.168.53.1 255.255.255.0
 duplex auto
 speed auto
!
interface FastEthernet0/1
 no ip address
 duplex auto
 speed auto
 shutdown
!
interface Serial0/0
 ip address 192.168.52.9 255.255.255.252
 clock rate 56000
!
interface Serial0/1
 ip address 192.168.52.6 255.255.255.252
!
router eigrp 1
 redistribute static 
 network 192.168.2.4 0.0.0.3
 network 192.168.2.8 0.0.0.3
 network 192.168.3.0
 no auto-summary
!
router ospf 1
 router-id 3.3.3.3
 log-adjacency-changes
 network 192.168.52.8 0.0.0.3 area 0
 network 10.53.53.0 0.0.0.3 area 0
 network 192.168.52.4 0.0.0.3 area 0
 network 192.168.53.0 0.0.0.255 area 0
!
ip classless
!
ip flow-export version 9
!
!
!
!
!
!
!
!
line con 0
!
line aux 0
!
line vty 0 4
 login
!
!
!
end
