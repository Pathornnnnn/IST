hostname Udon
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
 ip address 172.1.1.254 255.255.254.0
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
 ip address 172.1.2.129 255.255.255.252
!
interface Serial0/1
 ip address 192.168.2.10 255.255.255.252
!
router eigrp 1
 network 172.1.0.0 0.0.1.255
 network 172.1.2.128 0.0.0.3
 network 192.168.2.8 0.0.0.3
 no auto-summary
!
ip classless
!
ip flow-export version 9
!
!
access-list 100 deny tcp 172.1.0.0 0.0.1.255 192.168.3.0 0.0.0.255 eq ftp
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
