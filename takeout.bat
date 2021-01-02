ECHO 
set del=n
set /p del=Do you want to Delete Takeout Zipfiles [y/n] (default - %del%)?:

FOR /R %%I IN ("*.zip") do (
  "%ProgramFiles%\7-Zip\7z.exe" x -y -o"%%~dpI" "%%~fI" 
)

mkdir Google
IF "%del%" == "y" ( 
	del *.zip
) ELSE (
	mkdir bkup
	move *.zip bkup
)

For /R %%G IN (*.json) do del "%%G"
For /R %CD% %%x IN (*.*) do (
	echo "%%~nx" |findstr /i "takeout">nul || (
		move "%%x" "%CD%\Google\"
	)
)

del Takeout
