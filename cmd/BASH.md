# Bash hints

## Commands
- Replace a string with another string
```
sed -i 's/old-word/new-word/g' *.txt
```
- Connect via ssh with IP-address as a ROOT user
```
ssh root@201.344.223.221
```
- Create nested folders
```
mkdir -p folder1/folder2/folder3/folder4
```
- Save text to new file
```
echo "some text" > output.txt
```
- Add additional text into exist file
```
echo "some text" >> output.txt
```
- Check file/folder permissions
```
ls -l <path_to_file_dir>
```
- Updated systemctl services
```
systemctl daemon-reload
```
- Get list of running services by key-name
```
ps faux | grep mysql
```
- Kill list of running services by key-name
```
sudo kill -9 $(pgrep -f mysql)
```
- Get logs of running services by key-name
```
journalctl -u some.service // Press [END] button on the keyboard to get to the end of logs tail
```
- Find file in all directories
```
find . -name test.txt
```
