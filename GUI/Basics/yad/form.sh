#!/bin/bash

yad --text="\n     Welcome, Please fill in the user form before you could continue. All the information in this form are a must to be filled.\n\n" --form --title="User Info" --field="Name" --field="Age:NUM" --field="Username" --field="Password:H" --field="Choose the Program:FL" --field="Save to file:CHK" "" "18" "" "" "" "FALSE" --width=400

# All form types in yad
# :TXT - Text Input
# :NUM - Numerical Input
# :CHK - Check Box input
# :CB - Combo box (Dropdown)
# :CBE - Editable Dropdown
# :FL - File Chooser
# :MFL - Multifile chooser
# :DIR - Directory chooser
# :CDIR - Directory chooser create
# :CLR - Color Chooser
# :SCL - Slider
# :HCL - Hidden Field
# :BTN - Button
# :LBL - Label
# :FN - Font Chooser

# An all form




