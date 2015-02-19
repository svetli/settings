#!/bin/bash

PROJ_PATH=$PWD
PROJ_NAME="${PROJ_PATH##*/}"
PROJ_TAG_FILE="$HOME/.tagscache/$PROJ_NAME"
CTAGS_CMD=/usr/bin/ctags-exuberant

if [ ! -f $PROJ_TAG_FILE ]
then
    touch $PROJ_TAG_FILE
fi


EXCLUDE="--exclude='.git' --exclude='.cache' --exclude='*.js'"
REGEX_PHP_ABS='/(abstract)?\s+class\s+([^ ]+)/\2/c/'
REGEX_PHP_INT='/interface\s+([^ ]+)/\1/i/'
REGEX_PHP_FNC='/(static|abstract|public|protected|private)\s+(final\s+)?function\s+(\&\s+)?([^ (]+)/\4/f/'

$CTAGS_CMD -f $PROJ_TAG_FILE -h '.php' -R $EXCLUDE \
    --totals=yes \
    --tag-relative=yes \
    --PHP-kinds=cfiv \
    --regex-PHP="$REGEX_PHP_INT" \
    --regex-PHP="$REGEX_PHP_ABS" \
    --regex-PHP="$REGEX_PHP_FNC"
