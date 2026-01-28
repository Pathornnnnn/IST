hostname Bangkok
!
!
!
!
!
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
 ip address 172.1.2.126 255.255.255.128
 ip access-group 100 in
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
 ip address 192.168.2.5 255.255.255.252
 clock rate 56000
!
interface Serial0/1
 ip address 172.1.2.130 255.255.255.252
 clock rate 56000
!
router eigrp 1
 network 172.1.2.0 0.0.0.127
 network 172.1.2.128 0.0.0.3
 network 192.168.2.4 0.0.0.3
 no auto-summary
!
ip classless
!
ip flow-export version 9
!
!
access-list 100 deny tcp 172.1.2.0 0.0.0.127 172.1.0.0 0.0.1.255 eq telnet
access-list 100 permit ip any any
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
 password cisco
 login
 transport input telnet
!
!
!
end

