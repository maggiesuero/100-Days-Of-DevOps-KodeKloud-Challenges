ssh steve@stapp02

sudo useradd -s /sbin/nologin anita # /sbin/nologin prevents user from logging in interactively

grep anita /etc/passwd # Check if the user was added successfully
# anita:x:1001:1001::/home/anita:/sbin/nologin
