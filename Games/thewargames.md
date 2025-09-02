# The game is simple, follow the rules...
[Level 0]
Aim, to login int bandit.labs.overthewire.org on port 2220
password = bandit0
username = bandit0

[Level 1]
Aim, login using the password form level 0
Find the password for the next level from the dashed file in homedirectory
password = ZjLjTmM6FvvyRnrb2rfNWOZOTa6ip5If

[Level 2]
Login using pass form previous level
pass = 263JGJPfgU6LtdEvgfWU1XP5yac29mFx
Aim : Find the spaces file for password.

[Level 3]
Login using the previos level pass
pass = MNk8KNH3Usiio41PRUEoDFPqfxLPlSmx
Aim : Find password from the inhere directory

[Level 4]
Aim : To find password out of a human readable file...
pass = 2WmrDFRmJIq3IPxneAaMGhap0pFhF3NJ

In this case as every thing is human readable, we loop out to find the password
- Script

for i in $(ls -a); do
echo "[+] Checking for $i"
cat "./$i"
echo
done

[Level 5]
pass = 4oQYVPkxZOOEOO5pTW81FB8j8lxXGUQw
Aim:
	The password for next level is stored ina file somewhre under the inhere directory and has all of the following properties
	- human - readable
	1033 bytes in size
	not executable

- Script

for i in $(ls -a); do
echo "[+] Listing in $i"
ls -lha "$i"
echo
done

In our case, we see many files, and folders we cant go and chek in them for each time, so I created a loop
1033 bytes = roughly 1.1K (kib)
We are searching for something with 
-rw-r----- 1 root 1.1K

sorry, messing with it..., check manually
I guess this one
-rw-r----- 1 root bandit5 1.1K Apr 10 14:23 -file2
under the maybehere06

I think so we missed hidden files..
We will check here in 
-rw-r-----  1 root bandit5 1.1K Apr 10 14:23 .file2
under the maybehere07
Boom!, we got it...


[Level 6]
pass = HWasnPhtq9AVKe0dmk45nxy20cvUa6EG
Aim:
	Stored somewhere in the server
	Has all the following properties : 
	owned by user bandit 7
	owned by group bandit 6
	file is 33 bytes in size

we use the find command with the following opeionts
find
	-type f , because we are looking for a file
	-user bandit7, to find files owned by the 'bandit7' user
	-group bandit6, to find files owned by group
	-size 33c, to find files of size 33 bytes
We use 2>/dev/null because 2 indicates errors, and all the errors will be sent to blackhole of linux, the /dev/null, and only..
The non errored output is shown


[Level 7]
pass = morbNTDkSW6jIlUc0ymOdMaLnOlFVAaj
Aim : the password fo rhte next level is stored in the file data.txt next to the word millionth

This is a damn simple one....
cat data.txt | grep "millionth"

[Level 8]
pass = dfwvzFQi4mU0wfNbFOe9RoWskMLg7eEc
Aim : The password for the next level is stored in the file data.txt and is the only line of text that occurs only once

The Keyword here is : only once....
We use the sort function, sending the sorted list as a standard input to uniq -u (sort unique lines using u) using |
sort data.txt | uniq -u

[Level 9]
pass = 4CKMh1JI91bUIZZPXDqGanal4xvAg0JM
Aim : the password is in data.txt in one of the few human - readable strings, preceded by several '=' characters.
I use grep.
We use strings, which only prints printable letters...
strings data.txt | grep '==='

[Level 10]
pass = FGUW5ilLVJrxX9kMYMmlN4MgbpfMiqey
Aim : The password for the next level is stored in the data.txt, which contains base64 encoded data
