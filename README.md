# sevpnserver-ansible

This is an [Ansible](https://www.ansible.com/) Playbook that installs [SoftEther VPN](https://github.com/SoftEtherVPN/SoftEtherVPN) server along with some basic services:
  - HAProxy for sharing SSH, SSH-behind-SSL, and SoftEtherVPN on port 443
  - ISC-DHCP-SERVER for providing DHCP on the bridge
  - BIND9 Domain Name Server - for own resolution of domain names
  - BADVPN-UDP Gateway -  for use with HTTP Injector's UDP tunneling
  - DROPBEAR - for SSH with payload

### Default configuration
    - No IPTABLES script is provided, secure your server on your own risk
    - Port 443 is bound to haproxy
    - a bridge with the tap interface used by SE-VPN is created
      - This is to keep isc-dhcp-server bound to an interface
    - BIND9 - provides name resolution in the bridge
    - Dropbear listens on an alternate port (2224)

### SoftEtherVPN notes
    - the vpncmd script does the following:
        - the default virtualhub DEFAULT is deleted
        - a virtual hub named VPN is created
        - creates a user in the VPN virtualhub
            - with username: vpn
            - and password: vpn
        - creates a tap device called soft for bridging with the bridge
    - the configuration parameters of SoftEther is in /root/SEVPN.setup
    - the sample OpenVPN config file is in /root/se-vpn.ovpn
    
