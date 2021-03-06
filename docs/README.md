## Gists

### Conventional Commits

- *feat:* (new feature for the user, not a new feature for build script)
- *fix:* (bug fix for the user, not a fix to a build script)
- *docs:* (changes to the documentation)
- *style:* (formatting, missing semi colons, etc; no production code change)
- *refactor:* (refactoring production code, eg. renaming a variable)
- *test:* (adding missing tests, refactoring tests; no production code change)
- *chore:* (updating grunt tasks etc; no production code change)


### System Debugging

Check if any of the system services failed to start:

```shell
sudo systemctl --failed
```

### File Permissions

Set restricted permissions for files and directories:

```shell
# Find all directories in desired path and set 755 permission
find <path> -type d -exec chmod 755 {} +

# Find all files in desired path and grant only file creator write privs
find <path> -type f -exec chmod 644 {} +
```

### Syncing Data

Sync two directories locally:

```shell
# Backup home directory to mounted external drive
rsync -avzh --delete /path/to/directory /mnt/backup/
```

### Search and Replace

```shell
find . -type f -exec sed -i 's/OLD/NEW/g' {} +
```

### Drive Encryption

Encrypt drive partition with luks via [Average Linux User](https://www.youtube.com/watch?v=ch-wzDyo-wU) or [encrypt-drive](./help/guides/encrypt-drive.txt).


### Package Management

Remove unused packages and configurations (orphans) with yay:

```shell
yay --clean
```
Export installed packages in system:

```shell
yay -Qqen > pkglist.txt
yay -Qqem > pkglist-aur.txt
```

Add color to pacman by editing `/etc/pacman.conf`:

```shell
# /etc/pacman.conf
COLOR
```

Update global NPM packages:

```shell
npx npm-check-updates -g
```
