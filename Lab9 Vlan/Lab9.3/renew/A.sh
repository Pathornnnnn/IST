enable
conf t
!
version 15.0
service timestamps log datetime msec
service timestamps debug datetime msec
service password-encryption
!
hostname Switch_A
!
enable secret 5 $1$mERr$9cTjUIEqNGurQiFU.ZeCi1
!
spanning-tree mode pvst
spanning-tree extend system-id
!
! --- Configuration for Trunk Port ---
interface FastEthernet0/1
 switchport mode trunk
!
! --- Configuration for Access Ports (VLAN 1) ---
interface range FastEthernet0/2 - 3
 switchport mode access
!
! --- Configuration for Access Ports (VLAN 10) ---
interface range FastEthernet0/4 - 6
 switchport access vlan 10
 switchport mode access
!
! --- Configuration for Access Ports (VLAN 20) ---
interface range FastEthernet0/7 - 9
 switchport access vlan 20
 switchport mode access
!
! --- Configuration for Access Ports (VLAN 30) ---
interface range FastEthernet0/10 - 12
 switchport access vlan 30
 switchport mode access
!
! --- Management Interface ---
interface Vlan1
 ip address 192.168.23.1 255.255.255.0
 no shutdown
!
! --- Line Configuration ---
line con 0
 password Cisco
 login
!
line vty 0 15
 password Cisco
 login
!
end