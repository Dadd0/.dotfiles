# Rclone with OneDrive for Obsidian Workflow
Steps used on an Arch linux machine.

This setup keeps the Obsidian vault **fully local** for performance and uses `rclone bisync` to keep it in sync with Google Drive.
Sync is event driven when the folder containing the notes is updated, not time based.

### 1. Install rclone:
`sudo -v ; curl https://rclone.org/install.sh | sudo bash`

### 2. Configure it with the cloud:
use `rclone config` following the documentation

### 3. Bisync One-Time Baseline
Since `bisync` is stateful it requires an initial baseline, hence execute **once**
```
rclone bisync <remote_name>:<obsidian_vault_name> ~/<local_obsidian_vault_folder> \
  --resync \
  --exclude ".obsidian/workspace*" \
  --log-level INFO
```
Never use `--resync` again unless recovering because of corruption.

### 4. Systemd User Service 
Create the service:
`~/.config/systemd/user/rclone-obsidian.service`

```
[Unit]
Description=Rclone Bisync Obsidian Vault
After=network-online.target
Wants=network-online.target

[Service]
Type=oneshot
ExecStart=/usr/bin/rclone bisync google-drive:my-notes %h/Obsidian \
    --exclude ".obsidian/workspace*" \
    --log-level INFO
```

### 5. Systemd Path Unit
This is responsible for the execution of the user service when a file is modified in the vault.
Create the path watcher `~/.config/systemd/user/rclone-obsidian.path`

```
[Unit]
Description=Watch Obsidian Vault for Changes

[Path]
PathChanged=%h/Obsidian
PathModified=%h/Obsidian

[Install]
WantedBy=default.target
```

### 6. Enable it:
```
systemctl --user daemon-reload
systemctl --user enable --now rclone-obsidian.path
```

***

### Verify
To verify everything works, modify a file in the vault and check the logs with
`journalctl --user -u rclone-obsidian.service -f`
