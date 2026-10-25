#!/system/bin/sh
. ./scripts/common.sh
log "preuninstall wireless.carplay.aa"
check_addons || exit 1
_rev=$(installed_parts_rev)
log "undoing: $_rev"
apps_release
apps_hold "$_rev"
trap apps_release EXIT
uninstall_parts "$_rev" || exit 1
apps_release
rm -f "$PARTS_FILE"
adb_net_restore
sync
log "all parts back to stock - reboot the head unit to finish"
exit 0
