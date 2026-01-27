hostname Udon
!
!
!
!
ip dhcp excluded-address 192.168.1.1
ip dhcp excluded-address 192.168.1.255
!
ip dhcp pool LAN-POOL-X
 network 172.51.0.0 255.255.254.0
 default-router 172.51.0.1
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
interface FastEthernet0/0
 ip address 172.51.0.1 255.255.254.0
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
 ip address 172.51.2.129 255.255.255.252
!
interface Serial0/1
 ip address 192.168.52.10 255.255.255.252
!
router eigrp 1
 network 172.1.0.0 0.0.1.255
 network 172.1.2.128 0.0.0.3
 network 192.168.2.8 0.0.0.3
 no auto-summary
!
router ospf 1
 router-id 1.1.1.1
 log-adjacency-changes
 network 192.168.52.8 0.0.0.3 area 0
 network 172.51.2.128 0.0.0.3 area 0
 network 172.51.0.0 0.0.1.255 area 0
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