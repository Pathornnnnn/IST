
!
enable
conf t
hostname Router
!
!
!
!
!
!
!
!
ip cef
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
 no ip address
 no shutdown
 duplex auto
 speed auto
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
interface FastEthernet0/1
 no ip address
 duplex auto
 speed auto
 shutdown
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
