# AWS Instance Update TimeZone

1. Enter to instance via SSH
2. Create 'clock' file
```
cd /etc
sudo mkdir sysconfig // if not exits
cd sysconfig
sudo touch clock
```
3. Add next config to 'clock' file
```
ZONE="Asia/Riyadh"
UTC=false
```
4. Apply timezone
```
sudo ln -sf /usr/share/zoneinfo/Asia/Riyadh /etc/localtime
```
5. Reboot instance
```
sudo reboot
```
6. Check TZ
```
data
```