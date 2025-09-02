#!/bin/bash

# Set variables
gmdir="eof/configs/"
chardir="eof/characters/"
userconfig="eof/configs/user.config"

# Define the Characters and their scopes

johnmillow="
Character : John Millow
Strength : 100
Health : 200
Profession : Ex-Commander
Survival Rate : 80
Index Number : 0
"

liacorner="
Character : Lia Corner
Strength : 100
Health : 200
Profession : Ex-NSA-Agent
Survival Rate : 75
Index Number : 1
"

ethanhunt="
Character : Ethan Hunt
Strength : 150
Health : 200
Profession : Ex-CIA-Agent
Survival Rate : 80
Index Number : 2
"

jillvalentine="
Character : Jill Valentine
Strength : 120
Health : 200
Profession : Skilled-Cop
Survival Rate : 70
Index Number : 3
"

johnskennedy="
Character : John S Kennedy
Strength : 100
Health : 150
Profession : Student
Survival Rate : 85
Index Number : 4
"

aira="
Character : Aira
Strength : 100
Health : 200
Profession : Journalist
Survival Rate : 70
Index Number : 5
"

# A function for Building the character's files

BuildCharacter() {
	echo "[+] Checking for Character Builds..."
	if [[ -d "$chardir" ]]; then
		echo "[S] Character Directory Found !"
	else
		mkdir -p "$chardir"
		sleep 0.5
		echo "[E] Character Directory Not Found..."
		sleep 0.5
		echo "[+] Creating Directory for you..."
		sleep 0.5
		echo "[S] Success ! "
		sleep 0.5
	fi

	if [[ ! -f "${chardir}johnmillow.config" && ! -s "${chardir}johnmillow.config" ]]; then
		echo "[+] Building config for John Millow..."
		sleep 0.5
		echo "$johnmillow" > "${chardir}johnmillow.config"
		sleep 0.5
		echo "[S] Success ! "
		sleep 0.5
	else
		echo "[+] Build Already Found For John Millow..."
		sleep 0.5
	fi
	if [[ ! -f "${chardir}liacorner.config" && ! -s "${chardir}liacorner.config" ]]; then
		echo "[+] Building config for Lia Corner..."
		sleep 0.5
		echo "$liacorner" > "${chardir}liacorner.config"
		sleep 0.5
		echo "[S] Success ! "
		sleep 0.5
	else
		echo "[+] Build Already Found For Lia Corner..."
		sleep 0.5
	fi
	if [[ ! -f "${chardir}ethanhunt.config" && ! -s "${chardir}ethanhunt.config" ]]; then
		echo "[+] Building config for Ethan Hunt..."
		sleep 0.5
		echo "$ethanhunt" > "${chardir}ethanhunt.config"
		sleep 0.5
		echo "[S] Success !"
		sleep 0.5
	else
		echo "[+] Build Already Found For Ethan Hunt..."
		sleep 0.5
	fi
	if [[ ! -f "${chardir}jillvalentine.config" && ! -s "${chardir}jillvalentine.config" ]]; then
		echo "[+] Building config for Jill Valentine..."
		sleep 0.5
		echo "$jillvalentine" > "${chardir}jillvalentine.config"
		sleep 0.5
		echo "[S] Success ! "
		sleep 0.5
	else
		echo "[+] Build Already Found For Jill Valentine..."
		sleep 0.5
	fi
	if [[ ! -f "${chardir}johnskennedy.config" && ! -s "${chardir}johnskennedy.config" ]]; then
		echo "[+] Building config for John S kennedy"
		sleep 0.5
		echo "$johnskennedy" > "${chardir}johnskennedy.config"
		sleep 0.5
		echo "[S] Success ! "
		sleep 0.5
	else
		echo "[+] Build Already Found For John S Kennedy..."
		sleep 0.5
	fi
	if [[ ! -f "${chardir}aira.config" && ! -s "${chardir}aira.config" ]]; then
		echo "[+] Buildinf config for Aira..."
		sleep 0.5
		echo "$aira" > "${chardir}aira.config"
		sleep 0.5
		echo "[S] Success ! "
		sleep 0.5
	else
		echo "[+] Build Already Found For Aira..."
		sleep 0.5
	fi
}

# A function to check the user config file and create a new user if it is not existent
CheckUser() {
	if [[ -d "$gmdir" ]]; then
		echo "[S] Game Directory Successfully Found."
		sleep 0.5
		echo "[+] Checking for the user.config..."
		sleep 0.5
	else
		echo "[E] Game Directory Not Found !."
		sleep 0.5
		echo "[+] Creating the game directory..."
		sleep 0.5
		mkdir -p "$gmdir"
		echo "[+] Checking for the user.config..."
		sleep 0.5
		echo ""
	fi

	if [[ -f "$userconfig" && -s "$userconfig" ]]; then
		echo "[S] Success! The userconfig file is found... "
		sleep 0.5
		echo "[+] Checking for your information from the file..."
		sleep 0.5
		echo ""
		cat "$userconfig" | grep "User Name"
		cat "$userconfig" | grep "Game Level"
		cat "$userconfig" | grep "Last Played"
		cat "$userconfig" | grep "Character"
		cat "$userconfig" | grep "Strength"
		cat "$userconfig" | grep "Health"
		cat "$userconfig" | grep "Profession"
		cat "$userconfig" | grep "Survival Rate"
		echo ""
	else
		echo "[E] Seems that you are a new user..."
		sleep 0.5
		echo "[+] Creating a game config file for you, please follow the procedures..."
		sleep 0.5
		while true; do
			echo "[GAME CONFIG : I] Enter Your Full Name >"
			read fullname
			if [[ $fullname ]]; then
				break
			else
				echo "[GAME CONFIG : E] Please Enter a Valid Name..."
			fi
		done
		while true; do
			echo "[GAME CONFIG : I] Enter Your User Name (any) >"
			read username
			if [[ $username ]]; then
				break
			else
				echo "[GAME CONFIG : E] Please Enter a Valid Username..."
			fi
		done
		while true; do
			echo "[GAME CONFIG : I] Enter Your Age >"
			read age
			if [[ $age -gt 10 ]]; then
				break
			else
				echo "[GAME CONFIG : E] Sorry, your age must be a number and greater that 10..."
			fi
		done
		echo "[GAME CONFIG : I] Choose Your Character from the index number of the character..."
		echo ""
		echo "$johnmillow" "$liacorner" "$ethanhunt"
		echo "$jillvalentine" "$johnskennedy" "$aira"
		while true; do
			echo "[GAME CONFIG : I] Enter the Index Number >"
			read inum
			if [[ $inum -lt 6 && $inum -gt -1 ]]; then
				break
			else
				echo "[GAME CONFIG : E] Invalid Index Number, Please Enter valid index..."
			fi
		done
		if [[ "$inum" == "0" ]]; then
			character_config="$johnmillow"
		elif [[ "$inum" == "1" ]]; then
			character_config="$liacorner"
		elif [[ "$inum" == "2" ]]; then
			character_config="$ethanhunt"
		elif [[ "$inum" == "3" ]]; then
			character_config="$jillvalentine"
		elif [[ "$inum" == "4" ]]; then
			character_config="$johnskennedy"
		elif [[ "$inum" == "5" ]]; then
			character_config="$aira"
		else
			echo "[E] Unexpected Error"
		fi

		echo ""
		partial_config_content="
[Game Config]
Full Name : ${fullname}
User Name : ${username}
Age : ${age}
Game Level : 0
Last Played : $(date)
"
		config_content="
${partial_config_content}
${character_config}
"
		sleep 0.5
		echo "$config_content" > "$userconfig"
		sleep 0.5
		echo "[S] Config File creation successfull..."
	fi
}

# Define a function for getting the user credentials_______________________________________________________________________________
GetHealth() {
	health=$(cat "$userconfig" | grep "Health")
	health=$(expr "$health" : 'Health : \(.*\)')
	echo "${health}"
}

GetStrength() {
	strength=$(cat "$userconfig" | grep "Strength")
	strength=$(expr "$strength" : 'Strength : \(.*\)')
	echo "${strength}"
}

GetSurvivalRate() {
	sr=$(cat "$userconfig" | grep "Survival Rate")
	sr=$(expr "$sr" : 'Survival Rate : \(.*\)')
	echo "${sr}"
}

GetLevel() {
	level=$(cat "$userconfig" | grep "Game Level")
	level=$(expr "$level" : 'Game Level : \(.*\)')
	echo "${level}"
}

GetProfession() {
	pf=$(cat "$userconfig" | grep "Profession")
	pf=$(expr "$pf" : 'Profession : \(.*\)')
	echo "${pf}"
}

GetLastPlayed() {
	lp=$(cat "$userconfig" | grep "Last Played")
	lp=$(expr "$lp" : 'Last Played : \(.*\)')
	echo "${lp}"
}

GetAge() {
	age=$(cat "$userconfig" | grep "Age")
	age=$(expr "$age" : 'Age : \(.*\)')
	echo "${age}"
}

GetUserName() {
	un=$(cat "$userconfig" | grep "User Name")
	un=$(expr "$un" : 'User Name : \(.*\)')
	echo "${un}"
}

GetFullName() {
	fn=$(cat "$userconfig" | grep "Full Name")
	fn=$(expr "$fn" : 'Full Name : \(.*\)')
	echo "${fn}"
}

GetCharacter() {
	ch=$(cat "$userconfig" | grep "Character")
	ch=$(expr "$ch" : 'Character : \(.*\)')
	echo "${ch}"
}

# The Exec________________________________________________________________________________________________________________________
Main() {
	BuildCharacter
	echo ""
	echo "[Info] Clearing the screen in 3 seconds..."
	sleep 3
	clear
	CheckUser
	echo "[Info] Clearing the screen in 3 seconds..."
	sleep 3
	clear
	echo "Health : $(GetHealth)"
	echo "Strength : $(GetStrength)"
	echo "Character : $(GetCharacter)"
	echo "Last Played : $(GetLastPlayed)"
}


Main
