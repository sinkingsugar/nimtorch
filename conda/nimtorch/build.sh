ls $ATEN
mkdir -p $PREFIX/etc/conda/activate.d
mkdir -p $PREFIX/etc/conda/deactivate.d
echo "export ATEN=$PREFIX" >> $PREFIX/etc/conda/activate.d/env_vars.sh
echo "unset ATEN" >> $PREFIX/etc/conda/deactivate.d/env_vars.sh
cp -r $ATEN/* $PREFIX/
mkdir -p $PREFIX/dist/nimtorch
cp -r * $PREFIX/dist/nimtorch/
cp bin/.nimtorch-post-link.sh $PREFIX/bin/
