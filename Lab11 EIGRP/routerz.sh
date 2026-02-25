en
conf t
!
hostname Phuket
!
!
!
enable secret 5 $1$mERr$9cTjUIEqNGurQiFU.ZeCi1
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
license udi pid CISCO2901/K9 sn FTX1524GY38-
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
spanning-tree mode pvst
!
!
!
!
!
!
interface Loopback0
 ip address 10.1.1.1 255.255.255.252
!
interface GigabitEthernet0/0
 ip address 192.168.3.1 255.255.255.0
 duplex auto
 speed auto
!
interface GigabitEthernet0/1
 no ip address
 duplex auto
 speed auto
 shutdown
!
interface Serial0/0/0
 no ip address
 clock rate 2000000
 shutdown
!
interface Serial0/0/1
 ip address 192.168.2.6 255.255.255.252
!
interface Vlan1
 no ip address
 shutdown
!
ip classless
ip route 10.1.1.0 255.255.255.252 Loopback0 
ip route 192.168.3.0 255.255.255.0 GigabitEthernet0/0 
ip route 0.0.0.0 0.0.0.0 Serial0/0/1 
!
ip flow-export version 9
!
!
!
!
!
!
!
line con 0
 password cisco
 login
!
line aux 0
!
line vty 0 4
 password cisco
 login
!
!
!
end