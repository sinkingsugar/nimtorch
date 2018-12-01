mkdir %PREFIX%\dist\pkgs\nimtorch-#head
xcopy . %PREFIX%\dist\pkgs\nimtorch-#head /s /e
copy config.nims %PREFIX%\config\
