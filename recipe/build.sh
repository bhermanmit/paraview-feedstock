#!/bin/sh

mkdir build && cd build
cmake -LAH \
  -DCMAKE_INSTALL_PREFIX=${PREFIX} \
  -DCMAKE_PREFIX_PATH=${PREFIX} \
  -DCMAKE_INSTALL_RPATH:STRING=${PREFIX}/lib \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DVTK_INSTALL_LIBRARY_DIR="lib" \
  -DCMAKE_BUILD_TYPE=Release \
  -DPARAVIEW_INSTALL_DEVELOPMENT_FILES=ON \
  -DPARAVIEW_USE_VTKM=OFF \
  -DPARAVIEW_USE_PYTHON=ON \
  -DPython3_FIND_STRATEGY=LOCATION \
  -DPython3_ROOT_DIR=${PREFIX} \
  -DPARAVIEW_BUILD_WITH_EXTERNAL=ON \
  -DVTK_MODULE_USE_EXTERNAL_VTK_gl2ps=OFF \
  -DVTK_MODULE_USE_EXTERNAL_VTK_libharu=OFF \
  -DVTK_MODULE_USE_EXTERNAL_VTK_utf8=OFF \
  -DVTK_MODULE_USE_EXTERNAL_VTK_netcdf=OFF \
  -DVTK_MODULE_USE_EXTERNAL_ParaView_protobuf=OFF \
  -DPARAVIEW_ENABLE_WEB=ON \
  -DPARAVIEW_ENABLE_VISITBRIDGE=ON \
  -DVTK_MODULE_ENABLE_ParaView_VTKExtensionsCGNSWriter=NO \
  -DCMAKE_RULE_MESSAGES=OFF \
  ..
make install -j${CPU_COUNT}



