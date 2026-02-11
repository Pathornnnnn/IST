enable
conf t
!
hostname Switch_B
!
version 15.0
no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption
!
hostname Switch_B
!
enable secret 5 $1$mERr$9cTjUIEqNGurQiFU.ZeCi1
!
spanning-tree mode pvst
spanning-tree extend system-id
!
! --- Trunk Port ---
interface FastEthernet0/1
 switchport mode trunk
!
! --- Access Ports (VLAN Default/1) ---
interface range FastEthernet0/2 - 3
 switchport mode access
!
! --- Access Ports (VLAN 10) ---
interface range FastEthernet0/4 - 6
 switchport access vlan 10
 switchport mode access
!
! --- Access Ports (VLAN 20) ---
interface range FastEthernet0/7 - 9
 switchport access vlan 20
 switchport mode access
!
! --- Access Ports (VLAN 30) ---
interface range FastEthernet0/10 - 12
 switchport access vlan 30
 switchport mode access
!
! --- Management IP ---
interface Vlan1
 ip address 192.168.23.2 255.255.255.0
 no shutdown
!
! --- Line Access Control ---
line con 0
 password Cisco
 login
!
line vty 0 15
 password Cisco
 login
!
end