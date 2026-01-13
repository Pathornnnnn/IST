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
 ip address 192.168.192.1 255.255.254.0
!
interface Loopback1
 ip address 192.168.194.1 255.255.255.252
!
interface FastEthernet0/0
 ip address 192.168.51.1 255.255.255.128
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
 ip address 192.168.51.129 255.255.255.252
!
interface Serial0/1
 ip address 172.51.3.142 255.255.255.252
 clock rate 56000
!
interface Serial1/0
 no ip address
 clock rate 2000000
 shutdown
!
interface Serial1/1
 no ip address
 clock rate 2000000
 shutdown
!
router rip
 version 2
 network 172.51.0.0
 network 192.168.0.0
 network 192.168.51.0
 no auto-summary
!
ip classless
!
ip flow-export version 9
!
!
!
no cdp run
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
