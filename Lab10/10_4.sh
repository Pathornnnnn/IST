enable
configure terminal

! =========================
! 1) ตั้งค่า WAN Interface
! =========================
interface Serial0/0
 ip address 161.246.1.1 255.255.255.0
 ip nat outside
 no shutdown
exit

! Default Route ออก WAN
ip route 0.0.0.0 0.0.0.0 Serial0/0


! =========================
! 2) ตั้งค่า Router-on-a-Stick
! =========================
interface FastEthernet0/0
 no shutdown
exit

! ---- VLAN 10 ----
interface FastEthernet0/0.10
 encapsulation dot1Q 10
 ip address 192.168.10.254 255.255.255.0
 ip nat inside
 no shutdown
exit

! ---- VLAN 20 ----
interface FastEthernet0/0.20
 encapsulation dot1Q 20
 ip address 192.168.20.254 255.255.255.0
 ip nat inside
 no shutdown
exit


! =========================
! 3) Static NAT (เจาะจงเครื่อง)
! =========================
ip nat inside source static 192.168.10.1 161.246.1.100
ip nat inside source static 192.168.1.11 161.246.1.111
ip nat inside source static 192.168.1.12 161.246.1.112


! =========================
! 4) PAT สำหรับ VLAN 10
! =========================
access-list 10 permit 192.168.10.0 0.0.0.255

ip nat pool net10 161.246.1.101 161.246.1.102 netmask 255.255.255.0

ip nat inside source list 10 pool net10 overload


! =========================
! 5) PAT สำหรับ VLAN 20
! =========================
access-list 20 permit 192.168.20.0 0.0.0.255

ip nat pool net20 161.246.1.103 161.246.1.104 netmask 255.255.255.0

ip nat inside source list 20 pool net20 overload


! =========================
! 6) Save Config
! =========================
end
write memory
