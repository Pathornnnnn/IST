enable
configure terminal

! --- 1. การตั้งค่า Interface และ IP Address ---
interface FastEthernet0/0
 no shutdown
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
interface Serial0/0
 ip address 161.246.1.1 255.255.255.0
 ip nat outside
 no shutdown

! --- 2. การสร้าง Static Default Route ---
ip route 0.0.0.0 0.0.0.0 Serial0/0

! --- 3. การตั้งค่า Dynamic NAT ---
! สร้าง Access-list 1 ตามโจทย์ (2 statements)
access-list 1 permit 192.168.10.0 0.0.0.255
access-list 1 permit 192.168.20.0 0.0.0.255

! สร้าง NAT Pool ชื่อ 'net' (ต้องพิมพ์เล็กตามโจทย์)
ip nat pool net 161.246.1.101 161.246.1.102 netmask 255.255.255.0

! ผูก ACL เข้ากับ Pool
ip nat inside source list 1 pool net

end
write