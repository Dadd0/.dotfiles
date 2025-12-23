# Rclone with OneDrive
Steps used on an Arch linux machine/

1. Install rclone: `sudo -v ; curl https://rclone.org/install.sh | sudo bash`
2. Configure it with the cloud: `rclone config`
3. Write a `gdrive.sh` script containing
  ```
  #!/bin/bash
  rclone mount google-drive: ~/GoogleDrive
  ```
4. Write a service script to use with systemd every time after login, refer to ./gdrive.service
5. Enable the script: `systemctl --user enable gdrive.service`. If it doesn't work try refreshing the daemon with `systemctl --user daemon-reload`
