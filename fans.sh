#!/bin/bash

# for my amd machine

# execute as root

set_pwm() {
	cpu=$1
	gpu=$2

	# CPU
	cd /sys/class/hwmon/hwmon2
	echo 1 > pwm2_enable # enter manual mode
	echo $cpu > pwm2 # set

	# GPU
	cd /sys/class/drm/card0/device/hwmon/hwmon0
	echo 1 > pwm1_enable # enter manual mode
	echo $gpu > pwm1 # set
}

# 0 0 - off
# 80 80 - inaudable

case $1 in
	insane)
		set_pwm 256 256
		;;
	full)
		set_pwm 140 140
		;;
	normal)
		set_pwm 80 80
		;;
	silent)
		set_pwm 0 0
		;;
	*)
		echo "Usage: $0 {insane,full,normal,silent}"
		;;
esac
