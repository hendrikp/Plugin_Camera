@ECHO OFF
ECHO ***
ECHO *** Styling code according to your AStyle guidelines.
ECHO ***

REM Make an Astyle folder if they don't have one.
IF EXIST "%userprofile%\Documents\AStyle" GOTO TEAMCHECK
@ECHO *** Making a new AStyle folder to hold the styles.
MKDIR "%userprofile%\Documents\AStyle"

:TEAMCHECK
REM Use their personal style or a style suitable for source control / team?
IF NOT "%1"=="" GOTO TEAMSTYLE

:PERSONALSTYLE
IF EXIST "%userprofile%\Documents\AStyle\%username%.AStyle" GOTO PERSONALSTYLE2
@ECHO *** Copying the default style to your documents\astyle folder for future customisation.
COPY default.AStyle "%userprofile%\Documents\AStyle\%username%.AStyle"

:PERSONALSTYLE2
ECHO *** Applying personal style preferences.
ECHO ***
AStyle --options="%userprofile%\Documents\AStyle\%username%.AStyle" --recursive -n ..\src\*.h
AStyle --options="%userprofile%\Documents\AStyle\%username%.AStyle" --recursive -n ..\src\*.cpp
AStyle --options="%userprofile%\Documents\AStyle\%username%.AStyle" --recursive -n ..\inc\*.h
GOTO END

:TEAMSTYLE
IF EXIST "%userprofile%\Documents\AStyle\%1.AStyle" GOTO TEAMSTYLE2
@ECHO *** Creating a team / source control style in your documents\astyle folder.
COPY default.AStyle "%userprofile%\Documents\AStyle\%1.AStyle"

:TEAMSTYLE2
ECHO *** Applying team (%1) style preferences.
ECHO ***
AStyle --options="%userprofile%\Documents\AStyle\%1.AStyle" --recursive -n ..\src\*.h
AStyle --options="%userprofile%\Documents\AStyle\%1.AStyle" --recursive -n ..\src\*.cpp
AStyle --options="%userprofile%\Documents\AStyle\%1.AStyle" --recursive -n ..\inc\*.h
GOTO END

:END
PAUSE
