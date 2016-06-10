#!/bin/bash
# LGSM fix.sh function
# Author: Daniel Gibbs
# Website: https://gameservermanagers.com
lgsm_version="210516"

# Description: Overall function for managing fixes.
# Runs functions that will fix an issue.

# Messages that are displayed for some fixes
fn_fix_msg_start(){
	fn_print_dots "Applying ${fixname} fix: ${gamename}"
	sleep 1
	fn_print_info "Applying ${fixname} fix: ${gamename}"
	fn_scriptlog "Applying ${fixname} fix: ${gamename}"
	sleep 1
}

fn_fix_msg_end(){
	if [ $? -ne 0 ]; then
		fn_print_fail_nl "Applying ${fixname} fix: ${gamename}"
		fn_scriptlog "Failure! Applying ${fixname} fix: ${gamename}"
	else
		fn_print_ok_nl "Applying ${fixname} fix: ${gamename}"
		fn_scriptlog "Complete! Applying ${fixname} fix: ${gamename}"
	fi
}


# Fixes that are run on start
if [ "${function_selfname}" != "command_install.sh" ]; then
	if [ -n "${appid}" ]; then
		fix_steamcmd.sh
	fi

	if [ "${gamename}" == "Counter Strike: Global Offensive" ]; then
		fix_csgo.sh
	elif [ "${gamename}" == "Don't Starve Together" ]; then
		fix_dst.sh
	elif [ "${gamename}" == "Insurgency" ]||[ "${gamename}" == "Day fo Infamy" ]; then
		fix_ins.sh
	elif [ "${gamename}" == "ARMA 3" ]; then
		fix_arma3.sh
	fi

	if [ "${gamename}" != "Teamspeak 3" ]; then
		fix_glibc.sh
	fi
fi

# Fixes that are run on install only.
if [ "${function_selfname}" == "command_install.sh" ]; then
	if [ "${gamename}" == "Killing Floor" ]; then
		echo ""
		echo "Applying ${gamename} Server Fixes"
		echo "================================="
		sleep 1
		fix_kf.sh
	elif [ "${gamename}" == "Red Orchestra: Ostfront 41-45" ]; then
		echo ""
		echo "Applying ${gamename} Server Fixes"
		echo "================================="
		sleep 1
		fix_ro.sh
	elif [ "${gamename}" == "Unreal Tournament 2004" ]; then
		echo ""
		echo "Applying ${gamename} Server Fixes"
		echo "================================="
		sleep 1
		fix_ut2k4.sh
	elif [ "${gamename}" == "Unreal Tournament 99" ]; then
		echo ""
		echo "Applying ${gamename} Server Fixes"
		echo "================================="
		sleep 1
		fix_ut99.sh
	fi
fi
