if [[ "$(which md5)" != "" ]]
then
  MD5_PROGRAM=md5
fi

if [[ "$(which md5sum)" != "" ]]
then
  MD5_PROGRAM=md5sum
fi
