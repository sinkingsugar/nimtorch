mkdir -p $PREFIX/etc/conda/activate.d
mkdir -p $PREFIX/etc/conda/deactivate.d
echo 'export ATEN="'"$PREFIX"'"' >> "$PREFIX/etc/conda/activate.d/aten-env_vars.sh"
# echo 'export IOMP5_PATH="'"$PREFIX/lib/libiomp5.so"'"' >> "$PREFIX/etc/conda/activate.d/aten-env_vars.sh"
# echo 'export LD_PRELOAD="'"$LD_PRELOAD:$IOMP5_PATH"'"' >> "$PREFIX/etc/conda/activate.d/aten-env_vars.sh"
echo "unset ATEN" >> "$PREFIX/etc/conda/deactivate.d/aten-env_vars.sh"
# echo "unset IOMP5_PATH" >> "$PREFIX/etc/conda/deactivate.d/aten-env_vars.sh"
cp -r $ATEN/* $PREFIX/
