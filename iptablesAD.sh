set -x #echo on
echo "1" > /proc/sys/net/ipv4/ip_forward
iptables --flush
iptables --flush -t nat
iptables -t nat -A PREROUTING -p tcp --destination-port 80 -j REDIRECT --to-port 9000
#RPC endpoint mapper P135 TCP/UDP
iptables -t nat -A PREROUTING -p tcp --destination-port 135 -j REDIRECT --to-port 9000
iptables -t nat -A PREROUTING -p udp --destination-port 135 -j REDIRECT --to-port 9000 
#NETBIOS NS P137 TCP/UDP
iptables -t nat -A PREROUTING -p tcp --destination-port 137 -j REDIRECT --to-port 9000
iptables -t nat -A PREROUTING -p udp --destination-port 137 -j REDIRECT --to-port 9000
#NETBIOS datagram service P138 UDP
iptables -t nat -A PREROUTING -p udp --destination-port 138 -j REDIRECT --to-port 9000
#NETBIOS  session service P139 TCP
iptables -t nat -A PREROUTING -p tcp --destination-port 139 -j REDIRECT --to-port 9000
#SMB over IP P445 TCP/UDP
iptables -t nat -A PREROUTING -p tcp --destination-port 445 -j REDIRECT --to-port 9000
iptables -t nat -A PREROUTING -p udp --destination-port 445 -j REDIRECT --to-port 9000
#LDAP P389 TCP/UDP
iptables -t nat -A PREROUTING -p tcp --destination-port 389 -j REDIRECT --to-port 9000
iptables -t nat -A PREROUTING -p udp --destination-port 389 -j REDIRECT --to-port 9000
#LDP over SSL P636 TCP
iptables -t nat -A PREROUTING -p tcp --destination-port 636 -j REDIRECT --to-port 9000
#LDAP Glob Catalog SSL  P3269 TCP
iptables -t nat -A PREROUTING -p tcp --destination-port 3269 -j REDIRECT --to-port 9000
#LDAP Glob Catalog P3268
iptables -t nat -A PREROUTING -p tcp --destination-port 3268 -j REDIRECT --to-port 9000
#Kerberos P88 TCP UDP
iptables -t nat -A PREROUTING -p tcp --destination-port 88 -j REDIRECT --to-port 9000
iptables -t nat -A PREROUTING -p udp --destination-port 88 -j REDIRECT --to-port 9000
#WINS resolution P1512 TCP/UDP
iptables -t nat -A PREROUTING -p tcp --destination-port 1512 -j REDIRECT --to-port 9000
iptables -t nat -A PREROUTING -p udp --destination-port 1512 -j REDIRECT --to-port 9000
#WINS replication P42 TCP/UDP
iptables -t nat -A PREROUTING -p tcp --destination-port 42 -j REDIRECT --to-port 9000
iptables -t nat -A PREROUTING -p udp --destination-port 42 -j REDIRECT --to-port 9000
#AD WebServices & Man GW Service TCP 9389
iptables -t nat -A PREROUTING -p tcp --destination-port 9389 -j REDIRECT --to-port 9000
#IPSEC ISAKMP P500 UDP
iptables -t nat -A PREROUTING -p udp --destination-port 500 -j REDIRECT --to-port 9000
#NAT T P4500 UDP
iptables -t nat -A PREROUTING -p udp --destination-port 4500 -j REDIRECT --to-port 9000
#DNS Forwarder
iptables -t nat -A PREROUTING -p udp --destination-port 53 -j REDIRECT --to-port 53
#ASP.Net Session State P42424 TCP
iptables -t nat -A PREROUTING -p tcp --destination-port 42424 -j REDIRECT --to-port 9000
#list the IPtables to ensure accuracy
iptables -t nat -L
ifconfig
route -n

