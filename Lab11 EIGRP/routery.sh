en
conf t
hostname Bangkok
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
license udi pid CISCO2901/K9 sn FTX1524KC78-
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
interface GigabitEthernet0/0
 ip address 172.1.2.1 255.255.255.128
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
 ip address 192.168.2.5 255.255.255.252
 clock rate 56000
!
interface Serial0/0/1
 ip address 172.1.2.130 255.255.255.252
 clock rate 56000
!
interface Vlan1
 no ip address
 shutdown
!
router eigrp 123
 eigrp router-id 2.2.2.2
 redistribute static metric 10000 10 255 1 1500 
 network 172.1.2.128 0.0.0.3
 network 172.1.2.0 0.0.0.127
!
ip classless
ip route 0.0.0.0 0.0.0.0 Serial0/0/0 
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