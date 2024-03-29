#!/usr/bin/env bash
# use the Lysator mirror, because github throttles us
wget http://ftp.lysator.liu.se/pub/freenet/fred-releases/build01497/new_installer_offline_1497.jar \
  -O freenet-installer.jar
SOURCE_DIR=${PWD}
mkdir ~/Freenet
cd ~/Freenet
echo "${PWD}" | java -jar "${SOURCE_DIR}/freenet-installer.jar" -console
./run.sh stop
cat > freenet.ini <<EOF
fproxy.hasCompletedWizard=true
logger.priority=ERROR
pluginmanager.loadplugin=
pluginmanager.enabled=true
node.slashdotCacheSize=10m
node.minDiskFreeShortTerm=200m
node.uploadAllowedDirs=all
node.inputBandwidthLimit=80k
node.outputBandwidthLimit=80k
node.storeSize=100m
node.storeType=ram
node.assumeNATed=true
node.clientCacheType=ram
fcp.port=9481
fcp.bindTo=127.0.0.1,0:0:0:0:0:0:0:1
fcp.allowedHostsFullAccess=127.0.0.1,0:0:0:0:0:0:0:1
fcp.allowedHosts=127.0.0.1,0:0:0:0:0:0:0:1
node.opennet.enabled=true
node.load.subMaxPingTime=7000
node.load.maxPingTime=15000
End
EOF
./run.sh start
