Building configuration...

Current configuration : 1519 bytes
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
ip dhcp excluded-address 192.168.10.254
ip dhcp excluded-address 192.168.20.1 192.168.20.10
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
 ip nat inside
!
interface FastEthernet0/0.20
 encapsulation dot1Q 20
 ip address 192.168.20.254 255.255.255.0
 ip nat inside
!
interface FastEthernet0/1
 no ip address
 duplex auto
 speed auto
 shutdown
!
interface Serial0/0
 ip address 161.246.1.1 255.255.255.0
 ip nat outside
 clock rate 2000000
!
interface Serial0/1
 no ip address
 clock rate 2000000
 shutdown
!
ip nat inside source static 192.168.10.11 161.246.1.101 
ip nat inside source static 192.168.10.12 161.246.1.102 
ip nat inside source static 192.168.20.11 161.246.1.103 
ip nat inside source static 192.168.20.12 161.246.1.104 
ip classless
ip route 0.0.0.0 0.0.0.0 Serial0/0 
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