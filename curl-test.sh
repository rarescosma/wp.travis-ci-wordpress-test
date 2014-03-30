#!/bin/bash
base_url="http://wp.l"
echo "does it work?"
echo "raw:"
curl --silent "$base_url/test.php"
result=`curl --silent "$base_url/test.php"`

echo "result:"

if [ "$result" == "hello" ]
then
    echo "works!"
    exit 0;
fi

echo "failed :("
exit 1