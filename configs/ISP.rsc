# oct/09/2026 17:13:42 by RouterOS 6.49.17
# software id =
#
#
#
/interface ethernet
set [ find default-name=ether1 ] disable-running-check=no
set [ find default-name=ether2 ] disable-running-check=no
set [ find default-name=ether3 ] disable-running-check=no
set [ find default-name=ether4 ] disable-running-check=no
set [ find default-name=ether5 ] disable-running-check=no
set [ find default-name=ether6 ] disable-running-check=no
set [ find default-name=ether7 ] disable-running-check=no
set [ find default-name=ether8 ] disable-running-check=no
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip address
add address=20.25.35.1/24 interface=ether2 network=20.25.35.0
add address=192.168.56.60/24 interface=ether3 network=192.168.56.0
/ip dhcp-client
add disabled=no interface=ether1
/ip firewall nat
add action=masquerade chain=srcnat out-interface=ether1
add action=dst-nat chain=dstnat dst-address=192.168.56.60 dst-port=443 protocol=tcp to-addresses=20.25.35.2 to-ports=443
add action=masquerade chain=srcnat out-interface=ether2
add action=dst-nat chain=dstnat dst-address=192.168.56.60 dst-port=80 protocol=tcp to-addresses=20.25.35.2 to-ports=80
add action=dst-nat chain=dstnat dst-address=192.168.56.60 dst-port=8080 protocol=tcp to-addresses=20.25.35.2 to-ports=80
/system identity
set name=ISP
