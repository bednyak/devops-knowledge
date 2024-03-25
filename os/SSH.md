# Config for multiple ssh handling

- Go to .ssh folder and open 'config' file
```
cd ~/.ssh
sudo nano config
```

- Add appropriate setup to the config file (for Ubuntu)
```
Host bitbucket.org
HostName bitbucket.org
AddKeysToAgent yes
IdentityFile ~/.ssh/id_rsa-exadel

Host github.com
HostName github.com
AddKeysToAgent yes
IdentityFile ~/.ssh/id_rsa-exadel-git

Host newgit.computools.org
HostName newgit.computools.org
AddKeysToAgent yes
IdentityFile ~/.ssh/id_rsa-computools-git
```

- Add appropriate setup to the config file (for Mac)
```
Host bitbucket.org
HostName bitbucket.org
AddKeysToAgent yes
UseKeychain yes
IdentityFile ~/.ssh/id_rsa-exadel

Host github.com
HostName github.com
AddKeysToAgent yes
UseKeychain yes
IdentityFile ~/.ssh/id_rsa-exadel-git

Host newgit.computools.org
HostName newgit.computools.org
AddKeysToAgent yes
UseKeychain yes
IdentityFile ~/.ssh/id_rsa-computools-git
```