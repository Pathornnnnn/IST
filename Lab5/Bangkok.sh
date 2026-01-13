enable
configure terminal

hostname Bangkok

! ---------- INTERFACES ----------

interface Loopback0
 ip address 172.51.3.65 255.255.255.192
 no shutdown

interface Loopback1
 ip address 172.51.3.137 255.255.255.252
 no shutdown

interface FastEthernet0/0
 ip address 172.51.2.1 255.255.255.0
 duplex auto
 speed auto
 no shutdown

interface FastEthernet0/1
 shutdown

interface Serial0/0
 ip address 172.51.3.141 255.255.255.252
 no shutdown

interface Serial0/1
 ip address 172.51.3.134 255.255.255.252
 no shutdown

router rip
 version 1
 network 172.51.0.0

end
write memory

### v.2
enable
configure terminal

hostname Bangkok

! ---------- INTERFACES ----------

interface Loopback0
 ip address 172.51.3.65 255.255.255.192
 no shutdown

interface Loopback1
 ip address 172.51.3.137 255.255.255.252
 no shutdown

interface FastEthernet0/0
 ip address 172.51.2.1 255.255.255.0
 duplex auto
 speed auto
 no shutdown

interface FastEthernet0/1
 shutdown

interface Serial0/0
 ip address 172.51.3.141 255.255.255.252
 no shutdown

interface Serial0/1
 ip address 172.51.3.134 255.255.255.252
 no shutdown

router rip
 version 2
 no auto-summary
 network 172.51.0.0

end
write memory


# router rip
#  version 1
#  network 172.51.3.132
#  network 172.51.2.0
#  network 172.51.3.64
#  network 172.51.3.136
#  network 172.51.3.140