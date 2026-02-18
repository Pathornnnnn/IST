!
version 12.2
no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption
!
hostname StubRouter
!
!
!
!
ip dhcp excluded-address 192.168.10.1 192.168.10.10
ip dhcp excluded-address 192.168.20.1 192.168.20.10
ip dhcp excluded-address 192.168.10.254
ip dhcp excluded-address 192.168.20.254
!
ip dhcp pool vlan10
 network 192.168.10.0 255.255.255.0
 default-router 192.168.10.254
ip dhcp pool vlan20
 network 192.168.20.0 255.255.255.0
 default-router 192.168.20.254
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
 ip address 192.168.1.254 255.255.255.0
 duplex auto
 speed auto
!
interface FastEthernet0/0.10
 encapsulation dot1Q 10
 ip address 192.168.10.254 255.255.255.0
!
interface FastEthernet0/0.20
 encapsulation dot1Q 20
 ip address 192.168.20.254 255.255.255.0
!
interface FastEthernet0/1
 no ip address
 duplex auto
 speed auto
 shutdown
!
interface Serial0/0
 no ip address
 clock rate 2000000
 shutdown
!
interface Serial0/1
 no ip address
 clock rate 2000000
 shutdown
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
 password cisco
 login
 transport input telnet
line vty 5 15
 password cisco
 login
 transport input telnet
!
!
!
end