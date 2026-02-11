enable
conf t
! --- Basic Setup & Security ---
hostname Router-Core
service password-encryption
service timestamps log datetime msec
service timestamps debug datetime msec
!
! --- Interface Configuration (Router-on-a-Stick) ---
interface FastEthernet0/0
 no ip address
 duplex auto
 speed auto
 no shutdown
!
interface FastEthernet0/0.10
 description vlan 10
 encapsulation dot1Q 10
 ip address 192.168.2.254 255.255.255.0
!
interface FastEthernet0/0.20
 description vlan 20
 encapsulation dot1Q 20
 ip address 192.168.3.254 255.255.255.0
!
! --- Global Routing Settings ---
ip cef
ip classless
!
! --- Line Configuration ---
line con 0
 logging synchronous
 history size 20
line vty 0 4
 password cisco
 login
 transport input ssh telnet
!
end
write memory