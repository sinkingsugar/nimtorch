mkdir %PREFIX%\dist\pkgs\nimtorch-#head
xcopy . %PREFIX%\dist\pkgs\nimtorch-#head /s /e
mkdir %PREFIX%\config
copy config.nims %PREFIX%\config\
