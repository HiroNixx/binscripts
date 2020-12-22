#!/usr/bin/bash
head -10 /etc/hosts > /tmp/hosts
curl "https://someonewhocares.org/hosts/hosts" >> /tmp/hosts
cat /tmp/hosts > /etc/hosts
rm /tmp/hosts
