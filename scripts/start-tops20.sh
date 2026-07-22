#!/usr/bin/expect -f
# A simple script to start TOPS-20 using kn10-kl emulator
# Author: Aidan Simon
# License: GPL3

# Startup sequence
expect "KLH10#"
send "GO\r"
expect "BOOT>"
send "\r"
expect "Why reload?"
send "opr\r"
expect "Run CHECKD?"
send "yes\r"

# Let user interact afterward
interact
