#!/usr/bin/env sh

d=$(date -I)

f='_posts/'$d-$1.markdown

d+=' '$(date +"%T %z")

echo '---'           >> $f
echo 'layout: post'  >> $f
echo "title: \"$1\"" >> $f
echo "date: $d"      >> $f
echo 'author: Tina'  >> $f
echo 'tags:'         >> $f
echo ''              >> $f
echo '---'           >> $f

if [ $EDITOR != '' ]; then
    $EDITOR $f
fi
