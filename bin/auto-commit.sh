#!/bin/bash

pushd $HOME/.dotfiles
diff <(git status --short) /dev/null > /dev/null
[ $? == 0 ] && exit 0

emojis=("😀" "😃" "😄" "😁" "😆" "😅" "😂" "🤣" "☺️" "😊" "😇" "🙂" "🙃" "😉" "😌" "😍" "😘" "😗" "😙" "😚" "😋" "😜" "😝" "😛" "🤑" "🤗" "🤓" "😎" "🤡" "🤠" "😏" "😒" "😞" "😔" "😟" "😕" "🙁" "☹️" "😣" "😖" "😫" "😩" "😤" "😠" "😡" "😶" "😐" "😑" "😯" "😦" "😧" "😮" "😲" "😵" "😳" "😱" "😨" "😰" "😢" "😥" "🤤" "😭" "😓" "😪" "😴" "🙄" "🤔" "🤥" "😬" "🤐" "🤢" "🤧" "😷" "🤒" "🤕" "😈" "👿" "👹" "👺" "💩" "👻" "💀" "☠️" "👽" "👾" "🤖" "🎃" "😺" "😸" "😹" "😻" "😼" "😽" "🙀" "😿" "😾")

emoji=${emojis[$((RANDOM%${#emojis[*]}))]}

notify() {
  osascript -e 'display notification "failed to save dotfiles." with title "🆘 "'
  exit 1
}

trap 'notify' ERR
git add --all
git commit --all --message "$emoji"
git push origin master
osascript -e "display notification \"dotfiles saved!\" with title \"$emoji\""
