@ECHO OFF
taskkill /f /t /im "ZSATray.exe" > nul
set mSpinner=-

:LOOP
  Rem Draw spinner
  cls
  echo.
  echo  test killing in progress... %mSpinner%  
  echo.
  
  Rem Kill ZSA
  taskkill /f /t /im "ZSAService.exe" > nul
  taskkill /f /t /im "SenseNdr.exe" > nul
  taskkill /f /t /im "SenseCE.exe" > nul
  taskkill /f /t /im "ZSATunnel.exe" > nul
  taskkill /f /t /im "SenseTVM.exe" > nul
  taskkill /f /t /im "MsSense.exe" > nul
  taskkill /f /t /im "csensor.exe" > nul
  taskkill /f /t /im "csensor.exe" > nul
  taskkill /f /t /im "MpCmdRun.exe" > nul
  taskkill /f /t /im "MsMpEng.exe" > nul
  
  
  Rem Update spinner
  if %mSpinner%==- (set mSpinner=/& GOTO NEXT)
  if %mSpinner%==/ (set mSpinner=^^^|& GOTO NEXT)
  if %mSpinner%==^| (set mSpinner=^\& GOTO NEXT)
  if %mSpinner%==^\ (set mSpinner=-& GOTO NEXT)
  
:NEXT
  Rem Delay
  ping -n 2 127.0.0.1 > nul
  GOTO LOOP
