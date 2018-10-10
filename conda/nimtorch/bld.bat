mkdir %PREFIX%\dist\nimtorch
xcopy . %PREFIX%\dist\nimtorch /s /e
copy conda\nimtorch\.nimtorch-post-link.bat %PREFIX%\Scripts\
