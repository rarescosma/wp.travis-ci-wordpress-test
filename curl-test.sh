#!/bin/bash
base_url="http://wp.l"
echo "does it work?"
echo "raw:"
curl --silent "$base_url/test.php"
exit 0

result=`curl --silent "$base_url/"`

echo "result:"

if [ "$result" == "hello" ]
then
    echo "works!"
    exit 0;
fi

echo "failed :("
exit 1