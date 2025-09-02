#!/bin/bash

output=$(yad --form --title="Input Form" --width=300 \
	--field="User Details:LBL" \
	--field="Username:" \
	--field="Password:H" \
	--field="Other Information:LBL" \
	--field="Age:NUM" \
	--field="Gender:CB" \
	"" "" "" "" "0!17..35!1!1!" "Male!Female!Other!Rather not say!" \
	--columns=2 \
	--homogeneous \
	)
