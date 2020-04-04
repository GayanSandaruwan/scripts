:: create entity files
:: v 1.0
echo off
@echo off
goto skipcomment
********************************************************************
Author : Gayan Kavirathne - gayansandaruwan@github.com
Program : Entity Creator
Date : 4/4/2020
*********************************************************************/

:skipcomment

:: Get Input Parameters


:get_pack_id
set /p resource_pack_id=Choose the Resource Pack: 
if %TestFirstNum% EQU 1 (
	echo "Creating a New pack"
	GOTO new_pack
	) else (
	GOTO new_entity
	)

:new_pack
set /p resource_pack_name=Enter Resource Pack Name
set /p resource_pack_description=Enter Resource Pack Description
GOTO new_entity

:new_entity
set /p entity_name=Enter Entity Name
pause


