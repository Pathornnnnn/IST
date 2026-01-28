
hostname Phuket
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
interface Loopback0
 ip address 10.3.3.1 255.255.255.252
!
interface FastEthernet0/0
 ip address 192.168.3.254 255.255.255.0
 ip access-group 100 in
 duplex auto
 speed auto
!
interface FastEthernet0/1
 ip address 10.4.4.1 255.255.255.252
 duplex auto
 speed auto
!
interface Serial0/0
 ip address 192.168.2.9 255.255.255.252
 clock rate 56000
!
interface Serial0/1
 ip address 192.168.2.6 255.255.255.252
!
router eigrp 1
 redistribute static 
 network 192.168.2.4 0.0.0.3
 network 192.168.2.8 0.0.0.3
 network 192.168.3.0
 network 10.4.4.0 0.0.0.3
 no auto-summary
!
ip classless
ip route 0.0.0.0 0.0.0.0 Loopback0 
!
ip flow-export version 9
!
!
access-list 100 deny tcp host 192.168.3.11 172.1.0.0 0.0.1.255 eq telnet
access-list 100 deny tcp host 192.168.3.11 172.1.2.0 0.0.1.127 eq telnet
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