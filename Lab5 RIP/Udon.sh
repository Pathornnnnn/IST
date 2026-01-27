enable
configure terminal

hostname Udon

interface Loopback0
 ip address 172.51.3.1 255.255.255.252
 no shutdown

interface Loopback1
 ip address 172.51.3.129 255.255.255.252
 no shutdown

interface FastEthernet0/0
 ip address 172.51.0.1 255.255.254.0
 duplex auto
 speed auto
 no shutdown

interface FastEthernet0/1
 shutdown

interface Serial0/0
 ip address 172.51.3.133 255.255.255.252
 clock rate 56000
 no shutdown

interface Serial0/1
 ip address 192.168.51.130 255.255.255.252
 clock rate 56000
 no shutdown

router rip
 version 1
 network 172.51.0.0
 network 172.51.3.0
 network 172.51.3.128
 network 172.51.3.132
 network 192.168.51.128

end
write memory

### v.2
enable
configure terminal

hostname Udon

interface Loopback0
 ip address 172.51.3.1 255.255.255.252
 no shutdown

interface Loopback1
 ip address 172.51.3.129 255.255.255.252
 no shutdown

interface FastEthernet0/0
 ip address 172.51.0.1 255.255.254.0
 duplex auto
 speed auto
 no shutdown

interface FastEthernet0/1
 shutdown

interface Serial0/0
 ip address 172.51.3.133 255.255.255.252
 clock rate 56000
 no shutdown

interface Serial0/1
 ip address 192.168.51.130 255.255.255.252
 clock rate 56000
 no shutdown

router rip
 version 2
 no auto-summary
 network 172.51.0.0
 network 192.168.51.0

end
write memory

