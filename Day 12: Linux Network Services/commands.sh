ssh tony@stapp01
sudo systemctl status httpd

sudo netstat -tulpn | grep 3004 # Check if something is running on port 3004
# tcp        0      0 127.0.0.1:3004          0.0.0.0:*               LISTEN      431/sendmail: accep

sudo systemctl stop sendmail

sudo systemctl start httpd
sudo systemctl status httpd

sudo netstat -tlnp | grep :3004
# tcp        0      0 0.0.0.0:3004            0.0.0.0:*               LISTEN      1061/httpd

sudo iptables -L -n --line-numbers # Check firewall rules applied
"""
Chain INPUT (policy ACCEPT)
num  target     prot opt source               destination
1    ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0            state RELATED,ESTABLISHED
2    ACCEPT     icmp --  0.0.0.0/0            0.0.0.0/0
3    ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0
4    ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0            state NEW tcp dpt:22
5    REJECT     all  --  0.0.0.0/0            0.0.0.0/0            reject-with icmp-host-prohibited
"""

sudo iptables -I INPUT 5 -p tcp --dport 3004 -j ACCEPT # Insert rule to allow traffic on port 3004
sudo iptables -L -n --line-numbers


## From the Jump Host:

thor@jumphost ~$ curl http://stapp01:3004