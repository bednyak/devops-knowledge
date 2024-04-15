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
IdentitiesOnly yes

Host github.com
HostName github.com
AddKeysToAgent yes
IdentityFile ~/.ssh/id_rsa-exadel-git
IdentitiesOnly yes

Host newgit.computools.org
HostName newgit.computools.org
AddKeysToAgent yes
IdentityFile ~/.ssh/id_rsa-computools-git
IdentitiesOnly yes
```

- Add appropriate setup to the config file (for Mac)
```
Host bitbucket.org
HostName bitbucket.org
AddKeysToAgent yes
UseKeychain yes
IdentityFile ~/.ssh/id_rsa-exadel
IdentitiesOnly yes

Host github.com
HostName github.com
AddKeysToAgent yes
UseKeychain yes
IdentityFile ~/.ssh/id_rsa-exadel-git
IdentitiesOnly yes

Host newgit.computools.org
HostName newgit.computools.org
AddKeysToAgent yes
UseKeychain yes
IdentityFile ~/.ssh/id_rsa-computools-git
IdentitiesOnly yes
```