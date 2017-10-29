#!/bin/bash

pushd $HOME/.dotfiles
diff <(git status --short) /dev/null > /dev/null
[ $? == 0 ] && exit 0

emojis=("😀" "😃" "😄" "😁" "😆" "😅" "😂" "🤣" "☺️" "😊" "😇" "🙂" "🙃" "😉" "😌" "😍" "😘" "😗" "😙" "😚" "😋" "😜" "😝" "😛" "🤑" "🤗" "🤓" "😎" "🤡" "🤠" "😏" "😒" "😞" "😔" "😟" "😕" "🙁" "☹️" "😣" "😖" "😫" "😩" "😤" "😠" "😡" "😶" "😐" "😑" "😯" "😦" "😧" "😮" "😲" "😵" "😳" "😱" "😨" "😰" "😢" "😥" "🤤" "😭" "😓" "😪" "😴" "🙄" "🤔" "🤥" "😬" "🤐" "🤢" "🤧" "😷" "🤒" "🤕" "😈" "👿" "👹" "👺" "💩" "👻" "💀" "☠️" "👽" "👾" "🤖" "🎃" "😺" "😸" "😹" "😻" "😼" "😽" "🙀" "😿" "😾")

emoji=${emojis[$((RANDOM%${#emojis[*]}))]}

notify() {
  osascript -e 'display notification "failed to push GitHub"'
}

trap 'notify' ERR
git commit --all --message "$emoji"
osascript -e "display notification \"fire! $emoji\""
