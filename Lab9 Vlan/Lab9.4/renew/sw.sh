enable
configure terminal
!
hostname Switch_A
!
! --- Create VLANs (สำคัญมาก) ---
vlan 10
 name NetworkLab
vlan 20
 name IsagLab
exit
!
! --- Configure Access Ports ---
interface range FastEthernet0/1 - 2
 switchport mode access
 switchport access vlan 10
 spanning-tree portfast
!
interface range FastEthernet0/3 - 4
 switchport mode access
 switchport access vlan 20
 spanning-tree portfast
!
! --- Configure Trunk Port (เชื่อมไป Router f0/0) ---
interface FastEthernet0/15
 switchport mode trunk
 description LINK_TO_ROUTER
!
! --- Management IP ---
interface Vlan1
 ip address 192.168.23.1 255.255.255.0
 no shutdown
!
! --- Basic Security ---
line con 0
 logging synchronous
line vty 0 15
 password cisco
 login
!
end
write memory