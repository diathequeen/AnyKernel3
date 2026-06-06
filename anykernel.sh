# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=DiamondSU+ Kernel for OnePlus Nord CE2 Lite 5G
do.devicecheck=1
do.modules=1
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=oscaro
device.name2=OnePlus Nord CE2 Lite 5G
device.name3=CPH2409
device.name4=OP535DL1
device.name5=
supported.versions=15-16
supported.patchlevels=
'; } # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=1;
ramdisk_compression=auto;
patch_vbmeta_flag=auto;

## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;

## AnyKernel install
dump_boot;

# Install modules
if [ -d "$home/modules" ]; then
  ui_print " " "Installing kernel modules...";
  cp -rf $home/modules/vendor $SYSTEM_ROOT/;
fi;

write_boot;
## end install
