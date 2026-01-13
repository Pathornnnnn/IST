enable
configure terminal

hostname Phuket

! ---------- INTERFACES ----------

interface Loopback0
 ip address 192.168.192.1 255.255.254.0
 no shutdown

interface Loopback1
 ip address 192.168.194.1 255.255.255.252
 no shutdown

interface FastEthernet0/0
 ip address 192.168.51.1 255.255.255.128
 duplex auto
 speed auto
 no shutdown

interface FastEthernet0/1
 shutdown

interface Serial0/0
 ip address 192.168.51.129 255.255.255.252
 no shutdown

interface Serial0/1
 ip address 172.51.3.142 255.255.255.252
 no shutdown

router rip
 version 1
 network 172.51.0.0
 network 192.168.0.0

end
write memory
### v.2

enable
configure terminal

hostname Phuket

! ---------- INTERFACES ----------

interface Loopback0
 ip address 192.168.192.1 255.255.254.0
 no shutdown

interface Loopback1
 ip address 192.168.194.1 255.255.255.252
 no shutdown

interface FastEthernet0/0
 ip address 192.168.51.1 255.255.255.128
 duplex auto
 speed auto
 no shutdown

interface FastEthernet0/1
 shutdown

interface Serial0/0
 ip address 192.168.51.129 255.255.255.252
 no shutdown

interface Serial0/1
 ip address 172.51.3.142 255.255.255.252
 no shutdown

router rip
 version 2
 no auto-summary
 network 172.51.0.0
 network 192.168.0.0

end
write memory

# router rip
#  version 1
#  network 172.51.3.140
#  network 192.168.51.0
#  network 192.168.192.0
#  network 192.168.194.0
#  network 192.168.51.128