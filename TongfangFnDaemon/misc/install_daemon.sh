#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

# remove old TongfangFnDaemon
launchctl unload /Library/LaunchAgents/io.github.goshin.TongfangFnDaemon.plist > /dev/null 2>&1
sudo rm /Library/LaunchAgents/io.github.goshin.TongfangFnDaemon.plist > /dev/null 2>&1
sudo rm /usr/bin/TongfangFnDaemon > /dev/null 2>&1

sudo mkdir -p /usr/local/bin/
sudo chmod -R 755 /usr/local/bin/
sudo cp $DIR/TongfangFnDaemon /usr/local/bin/
sudo chmod 755 /usr/local/bin/TongfangFnDaemon
sudo chown root:wheel /usr/local/bin/TongfangFnDaemon

sudo cp $DIR/io.github.goshin.TongfangFnDaemon.plist /Library/LaunchAgents
sudo chmod 644 /Library/LaunchAgents/io.github.goshin.TongfangFnDaemon.plist
sudo chown root:wheel /Library/LaunchAgents/io.github.goshin.TongfangFnDaemon.plist

sudo launchctl load /Library/LaunchAgents/io.github.goshin.TongfangFnDaemon.plist
