mkdir %PREFIX%\etc\conda\activate.d
mkdir %PREFIX%\etc\conda\deactivate.d
@echo set ATEN=%PREFIX% >> %PREFIX%\etc\conda\activate.d\env_vars.bat
@echo set ATEN= >> %PREFIX%\etc\conda\deactivate.d\env_vars.bat
xcopy %ATEN% %PREFIX% /s /e
