@echo off
SETLOCAL EnableExtensions DisableDelayedExpansion

if exist build rmdir /s /q build
mkdir build
cd build

cmake %SRC_DIR% ^
    -DBUILD_AZURE_KINECT=OFF ^
    -DBUILD_CUDA_MODULE=OFF ^
    -DBUILD_COMMON_CUDA_ARCHS=OFF ^
    -DBUILD_CACHED_CUDA_MANAGER=OFF ^
    -DBUILD_EXAMPLES=OFF ^
    -DBUILD_ISPC_MODULE=OFF ^
    -DBUILD_GUI=OFF ^
    -DBUILD_LIBREALSENSE=OFF ^
    -DBUILD_PYTORCH_OPS=OFF ^
    -DBUILD_REALSENSE=OFF ^
    -DBUILD_SHARED_LIBS=ON ^
    -DBUILD_TENSORFLOW_OPS=OFF ^
    -DBUILD_WEBRTC=OFF ^
    -DENABLE_HEADLESS_RENDERING=OFF ^
    -DBUILD_JUPYTER_EXTENSION=OFF ^
    -DOPEN3D_USE_ONEAPI_PACKAGES=OFF ^
    -DUSE_BLAS=ON ^
    -DUSE_SYSTEM_ASSIMP=ON ^
    -DUSE_SYSTEM_BLAS=ON ^
    -DUSE_SYSTEM_CURL=ON ^
    -DUSE_SYSTEM_EIGEN3=ON ^
    -DUSE_SYSTEM_EMBREE=ON ^
    -DUSE_SYSTEM_FMT=ON ^
    -DUSE_SYSTEM_GLEW=ON ^
    -DUSE_SYSTEM_GLFW=ON ^
    -DUSE_SYSTEM_GOOGLETEST=ON ^
    -DUSE_SYSTEM_IMGUI=ON ^
    -DUSE_SYSTEM_JPEG=ON ^
    -DUSE_SYSTEM_JSONCPP=ON ^
    -DUSE_SYSTEM_LIBLZF=ON ^
    -DUSE_SYSTEM_LIBREALSENSE=OFF ^
    -DUSE_SYSTEM_MSGPACK=ON ^
    -DUSE_SYSTEM_NANOFLANN=ON ^
    -DUSE_SYSTEM_OPENSSL=ON ^
    -DUSE_SYSTEM_PNG=ON ^
    -DUSE_SYSTEM_PYBIND11=ON ^
    -DUSE_SYSTEM_QHULLCPP=OFF ^
    -DUSE_SYSTEM_TBB=OFF ^
    -DUSE_SYSTEM_TINYGLTF=OFF ^
    -DUSE_SYSTEM_TINYOBJLOADER=ON ^
    -DUSE_SYSTEM_VTK=ON ^
    -DUSE_SYSTEM_ZEROMQ=ON ^
    -DWITH_IPPICV=OFF ^
    -DWITH_FAISS=OFF ^
    -DPython3_EXECUTABLE=%PYTHON%

cmake --build . --config Release -- /m:%CPU_COUNT%

cmake --build . --config Release --target install

cmake --build . --config Release --target install-pip-package
