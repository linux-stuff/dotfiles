#!/bin/bash
ssh robopop "mkdir /tmp/muttattach"
ssh robopop "touch /tmp/muttattach/filename_fifo"
ssh robopop "tail -f -n 0 /tmp/muttattach/filename_fifo" | while read line; do
	file=$(basename $line)
	scp robopop:/tmp/muttattach/$file /tmp/
	ssh robopop "rm /tmp/muttattach/$file" &
	xdg-open /tmp/$file
	rm /tmp/$file
done
