mkdir %PREFIX%\etc\conda\activate.d
mkdir %PREFIX%\etc\conda\deactivate.d
@echo set ATEN=%PREFIX%>> %PREFIX%\etc\conda\activate.d\aten-env_vars.bat
@echo set ATEN_LIBS=%PREFIX%/lib>> %PREFIX%\etc\conda\activate.d\aten-env_vars.bat
@echo set PATH=%PATH%;%%ATEN_LIBS%%>> %PREFIX%\etc\conda\activate.d\aten-env_vars.bat
@echo set ATEN>> %PREFIX%\etc\conda\deactivate.d\aten-env_vars.bat
@echo set ATEN_LIBS>> %PREFIX%\etc\conda\deactivate.d\aten-env_vars.bat
xcopy %ATEN% %PREFIX% /s /e
