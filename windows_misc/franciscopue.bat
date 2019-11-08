@echo off
goto skipcomment
********************************************************************
Author :
Course :
Professor :
Program # :
Due Date :
Name :
Class :
*********************************************************************/

:skipcomment

:firstNumber
set /p FirstNumber=Enter the First number :

set /a TestFirstNum=FirstNumber
if %TestFirstNum% EQU 0 (
  if %FirstNumber% EQU 0 (
    echo Valid Number
  ) else (
    echo Not a number, Try again..
	goto firstNumber	
  )
) else (
  echo Valid Number
   if %FirstNumber% EQU 22 (
    echo Entered 22 exitting the loop
	goto exitprog
  )
)

:secondNumber
set /p SecondNumber=Enter the Second number :
set /a TestSecondNum=SecondNumber
if %TestSecondNum% EQU 0 (
  if %SecondNumber% EQU 0 (
    echo Cannot Divide by "Zero" enter a none zero number..
	goto secondNumber
  ) else (
    echo Not a number, Try again..
	goto secondNumber	
  )
) else (
  echo Valid Number
   if %SecondNumber% EQU 22 (
    echo Entered 22 exitting the loop
	goto exitprog
  )
)

SET /a answer=FirstNumber/SecondNumber
echo %FirstNumber% divided by %SecondNumber% = %answer%
goto firstNumber
:exitprog
pause