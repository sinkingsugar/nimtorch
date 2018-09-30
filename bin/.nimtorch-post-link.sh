# required by conda, to inject this module in the nim modules path
echo "-p:\"$PREFIX/dist/nimtorch\"" >> $PREFIX/config/nim.cfg
# also inject aten path when installed directly in the base environment
echo "-d:atenPath=\"$PREFIX\"" >> $PREFIX/dist/nimtorch/nim.cfg
