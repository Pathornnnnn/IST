Building configuration...

Current configuration : 668 bytes
!
version 12.2
no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption
!
hostname ISPRouter
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
 ip address 161.246.5.254 255.255.255.0
 duplex auto
 speed auto
!
interface FastEthernet0/1
 ip address 161.246.6.254 255.255.255.0
 duplex auto
 speed auto
!
interface Serial0/0
 ip address 161.246.1.254 255.255.255.0
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
 login
!
!
!
end
