#!/bin/sh

mkdir -p /usr/local/www			

# Clone source from official HugoMeet repository
cd /usr/local/www
git clone git://github.com/Ph0enixLeader/HugoMeetDev --quiet --depth 1 HugoMeet
if [ $? -ne 0 ] ; then
  echo "ERROR: Failed to get source from HugoMeet Repository"
  exit 1
fi

# Create user mcserver
pw useradd -n hugomeetserver -u 199 -G www -d /nonexistent -s /usr/local/bin/bash -h 0 <<EOF
hugomeetserver
EOF

echo
cat <<EOF > /root/PLUGIN_INFO
#---------------------------------------------------------------------#
# Getting started with the HugoMeet plugin
#---------------------------------------------------------------------#

#HugoMeet is a server front-end to ease talk video.
#For more information, see https://github.com/hcabel/HugoMeet

EOF

cat /root/PLUGIN_INFO
