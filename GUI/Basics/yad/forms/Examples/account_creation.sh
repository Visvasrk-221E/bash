#!/bin/bash


# Define the variables
is_auth=false
cfgdir="HumanNowhere/config/"

# Define the register form function

Register() {

# Start function

# Generate the output

output=$(yad --form --title="Registration | Human Nowhere" --width=400 --columns=1 --homogeneous --markup \
	--field="\n <b>User Details</b>:LBL" \
	--field=":LBL" \
	--field=" Name:" \
	--field=" Age::NUM" \
	--field=" Date of Birth::DT" \
	--field=" Gender::CB" \
	--field="\n <b>Account Creation</b>:LBL" \
	--field=":LBL" \
	--field=" Username:" \
	--field=" Password::H" \
	--field=" Email:" \
	--field="\n:LBL" \
	--field="I accept the terms and conditions of Human Nowhere:CHK" \
	"" "" "" "0!17..50!1!1!" "Click the icon to pick" "Male!Female!Other!Rather not say!" "" "" "" "" "user@example.com" "" "TRUE" \

)

# Check for operation cancellation

if [[ $? -ne 0 ]]; then
	echo "[-] Operation Cancelled by user..."
	exit 1
else
	echo "[+] Operation Success..."
	echo "[+] Unparsed Output : ${output}"
fi

# Parse the output

echo "[+] Parsing output... "
IFS="|" read -r _ _ name age dob gender _ _ username password email _ agreement <<< "$output"

if [[ "$agreement" == "TRUE" ]]; then
	agreement=true
else
	agreement=false
	echo "[E] User did not agree with the policies of human nowhere..."
	yad --error --title="Acceptancy Conflict" --text="\n Seems like you didn't accept the terms and conditions of Human Nowhere.\n Login again..." --on-top --timeout=10
	exit 1
fi

echo "[+] Parsing Success..."
echo "[+] Processing user..."
echo

# Check for existence of the config directory

if [[ ! -d "$cfgdir" ]]; then
	echo "[-] Configuration folder not found, creating one..."
	mkdir -p "$cfgdir"
	echo "[S] Successfully created config folder..."
else
	echo "[+] Configuration folder already exists..."
fi

# Check the existance of the user

if [[ ! -f "${cfgdir}${username}.config" && ! -s "${cfgdir}${username}.config" ]]; then
	echo "[+] User not already present, Adding $username to Human Nowhere Community..."
	userinfo="
[User Info]

Name : $name
Age : $age
Date of Birth : $dob
Gender : $gender
Username : $username
Password : $password
Email : $email
Agreement : $agreement
"
	echo "$userinfo" > "${cfgdir}${username}.config"
	echo "[+] Susccessfully added user to Human Nowhere"
else
	echo "[E] User already exists, try again with another username..."
	yad --error --title="User Exists Conflicts" --text="\n Seems like the username already exists, try again with another user...\n" --timeout=10 --on-top
	exit 1
fi

# Print the credentials
echo "[+] User Information"
echo "$userinfo"

# End function
}

# Function for Login

Login() {

# Start Login

# Generate Output
output=$(yad --form --title="Login | Human Nowhere" --width=400 --columns=1 --homogeneous --markup \
	--field="\n <b>Login with your credentials...</b>:LBL" \
	--field=":LBL" \
	--field="Username:" \
	--field="Password::H" \
	--field=":LBL" \
	--field="I am not a Robot:CHK" \
	"" "" "" "" "" "FALSE" \
)

# Check for operation cancellation

if [[ $? -ne 0 ]]; then
	echo "[-] Operation Cancelled by user..."
	exit 1
else
	echo "[+] Operation Success..."
	echo "[+] Unparsed Output : $output"
fi

# Parse the output

IFS="|" read -r _ _ username password _ non_robot <<< "$output"

# Check for robotancy

echo "[+] Checking for non robotancy..."
if [[ "$non_robot" == "TRUE" ]]; then
	echo "[S] User is not a robot..."
else
	echo "[E] Seems that user is a robot..."
	echo "[E] Please Login again..."
	yad --error --title="Robotancy Error" --text="\n Seems like you are a robot...\n Login again" --width=300 --time-out=10 --on-top
	exit 1
fi

# Check for the directory existence

echo "[+] Checking for the existence of directory..."
if [[ ! -d "$cfgdir" ]]; then
	echo "[E] Seems like someone has deleted the Human Nowhere configuration folder..."
	echo "[-] Configuration folder not found, creating one..."
	mkdir -p "$cfgdir"
	echo "[S] Successfully created config folder..."
	exit 1
else
	echo "[+] Configuration folder already exists..."
fi

# Fetch User and check for the user existence
userfile="${cfgdir}${username}.config"
echo "[+] Checking for user's existence..."
if [[ -f "$userfile" ]]; then
	echo "[+] Authorised Username..."
	echo "[+] Checking the password match..."
	userpass=$(cat "$userfile" | grep "Password :")
	userpass=$(expr "$userpass" : 'Password : \(.*\)')
	if [[ "$userpass" == "$password" ]]; then
		echo "[+] Authorised Password..."
		echo "[S] Authorisation Success..."
		yad --info --title="Authorised | Human Nowhere" --text="\n Welcome, ${username}. You are authorised to enter Human Nowhere." --width=300 --time-out=10 --on-top
	else
		echo "[E] Password mismatch, try again later..."
		yad --error --title="Password Mismatch Error" --text="\n Password is incorrect, please try again..." --width=300 --time-out=10 --on-top
		exit 1
	fi
else
	echo "[E] Unauthorised Access..."
	echo "[-] Username Not Found (UNF Error)"
	yad --error --title="UNF Error" --text="\n Username is not found, try again with a valid username..." --width=300 --time-out=10 --on-top
	exit 1
fi

}



# Main Executive

echo "[+] Welcome to Human Nowhere Registration Utility..."
echo "[+] Starting your registration process..."

#Register
#Login
