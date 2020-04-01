#!/bin/sh
while true; do
	# not using urxvtc here, as we're relying on the process to run
	# until either
	#
	# * it gets detached (eg by ^Ad)
	# * it terminates (because someone killed all windows)
	#
	# in any case, we try to reattach to the session, or, if that fails,
	# create a new one.
	#urxvt -name scratchpad -e $SHELL -c 'echo herp; xrdb -query; echo derp; $SHELL -i'
    urxvt -name scratchpad
done
