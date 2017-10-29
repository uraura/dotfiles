#!/bin/bash

notify() {
  osascript -e 'display notification "failed to update brew." with title "🆘"'
  exit 1
}

trap 'notify' ERR

$HOME/bin/brew update
$HOME/bin/brew upgrade
osascript -e 'display notification "successfully updated brew formulas." with title "😄"'
