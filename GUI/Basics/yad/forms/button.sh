#!/bin/bash

func() {
	yad --title="Info" --text="\n	Success\n"
}

yad --form --field="Click Here:BTN" gnome-terminal
yad --form --field="Gnome-Terminal:FBTN" gnome-terminal
