hostname Bangkok
!
!
!
!
ip dhcp excluded-address 172.51.2.1
ip dhcp excluded-address 172.51.2.255
!
ip dhcp pool LANN-POOL-Y
 network 172.51.2.0 255.255.255.128
 default-router 172.51.2.1
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
 ip address 172.51.2.1 255.255.255.128
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
 ip address 192.168.53.5 255.255.255.252
 clock rate 56000
!
interface Serial0/1
 ip address 172.51.2.130 255.255.255.252
 clock rate 56000
!
router eigrp 1
 network 172.1.2.0 0.0.0.127
 network 172.1.2.128 0.0.0.3
 network 192.168.2.4 0.0.0.3
 no auto-summary
!
router ospf 1
 router-id 2.2.2.2
 log-adjacency-changes
 network 172.51.2.128 0.0.0.3 area 0
 network 192.168.52.4 0.0.0.3 area 0
 network 172.51.2.0 0.0.0.127 area 0
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