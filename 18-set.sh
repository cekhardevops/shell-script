#!/bin/bash

set -e #for debug set -ex

echo "hello world"
echhhhhhhh "sdfsdfsd"
echo "after error"

failure(){
    echo "failed at : $1 $2
}

# trap function when executing script, it will give ERR signal

trap 'failure "${LINENO}" ${BASH_COMMAND}' ERR