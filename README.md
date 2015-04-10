# Caffe

Caffe is a deep learning framework made with expression, speed, and modularity in mind.
It is developed by the Berkeley Vision and Learning Center ([BVLC](http://bvlc.eecs.berkeley.edu)) and community contributors.

Check out the [project site](http://caffe.berkeleyvision.org) for all the details like

- [DIY Deep Learning for Vision with Caffe](https://docs.google.com/presentation/d/1UeKXVgRvvxg9OUdh_UiC5G71UMscNPlvArsWER41PsU/edit#slide=id.p)
- [Tutorial Documentation](http://caffe.berkeleyvision.org/tutorial/)
- [BVLC reference models](http://caffe.berkeleyvision.org/model_zoo.html) and the [community model zoo](https://github.com/BVLC/caffe/wiki/Model-Zoo)
- [Installation instructions](http://caffe.berkeleyvision.org/installation.html)

and step-by-step examples.

[![Join the chat at https://gitter.im/BVLC/caffe](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/BVLC/caffe?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

Please join the [caffe-users group](https://groups.google.com/forum/#!forum/caffe-users) or [gitter chat](https://gitter.im/BVLC/caffe) to ask questions and talk about methods and models.
Framework development discussions and thorough bug reports are collected on [Issues](https://github.com/BVLC/caffe/issues).

Happy brewing!

## License and Citation

Caffe is released under the [BSD 2-Clause license](https://github.com/BVLC/caffe/blob/master/LICENSE).
The BVLC reference models are released for unrestricted use.

Please cite Caffe in your publications if it helps your research:

    @article{jia2014caffe,
      Author = {Jia, Yangqing and Shelhamer, Evan and Donahue, Jeff and Karayev, Sergey and Long, Jonathan and Girshick, Ross and Guadarrama, Sergio and Darrell, Trevor},
      Journal = {arXiv preprint arXiv:1408.5093},
      Title = {Caffe: Convolutional Architecture for Fast Feature Embedding},
      Year = {2014}
    }
___
# Caffe for Windows 7 x64
___

Compile Caffe with Visual Studio 2013 on Windows 7 x64, using boost 1.57.0, Cuda 7.0, OpenCV 2.4.11 and OpenBlas 0.2.14.  

After succesfully build, you will get `caffe.exe` and `convert_mnist_data.exe` under path `bin`, which can be used for Train-and-Test on the dataset `mnist`.

## Thanks
* Thanks BVLC for [caffe](https://initialneil.wordpress.com/2015/01/11/build-caffe-in-windows-with-visual-studio-2013-cuda-6-5-opencv-2-4-9/).
* Mainly reference to [Neil Z.Shao's Blog](https://initialneil.wordpress.com/2015/01/11/build-caffe-in-windows-with-visual-studio-2013-cuda-6-5-opencv-2-4-9/).

## Requirements
* caffe [source](https://github.com/BVLC/caffe)
* Visual Studio [v2013]()
* CUDA [v7.0.28](http://developer.download.nvidia.com/compute/cuda/7_0/Prod/local_installers/cuda_7.0.28_windows.exe)
* boost [v1.57.0](http://jaist.dl.sourceforge.net/project/boost/boost/1.57.0/boost_1_57_0.zip)
* OpenCV [v2.4.11](http://jaist.dl.sourceforge.net/project/opencvlibrary/opencv-win/2.4.11/opencv-2.4.11.exe)
* OpenBlas [v0.2.14-Win64](http://ncu.dl.sourceforge.net/project/openblas/v0.2.14/OpenBLAS-v0.2.14-Win64-int64.zip)
* GFlags [source]()
* GLog [source]()
* ProtoBuf [source]()
* LevelDB [source]()
* HDF5 [v1.8.14-win64](http://www.hdfgroup.org/ftp/HDF5/current/bin/windows/extra/hdf5-1.8.14-win64-vs2013-shared.zip)
* LMDB [source]()


## Pre-Build
### Install `Visual Studio, CUDA, boost, OpenCV, and OpenBlas`. 

### Compile `GFlags, GLog, ProtoBuf, LevelDB, HDF5, and LMDB` from source. 
Then put then under the  header and library files`msvc/3rdparty` folder like this.

```
	3rdparty
	├─gflags
	│  ├─include
	│  │  └─gflags
	│  └─x64
	│      └─Release
	├─glog
	│  ├─glog
	│  └─x64
	│      └─Release
	├─HDF5
	│  ├─bin
	│  ├─include
	│  └─lib
	├─leveldb
	│  ├─include
	│  │  └─leveldb
	│  └─x64
	│      └─Release
	├─lmdb
	│  ├─include
	│  └─x64
	│      └─Release
	├─openblas
	│  ├─bin
	│  ├─include
	│  └─lib
	├─port
	└─protobuf
	    ├─include
	    │  └─google
	    │      └─protobuf
	    │          ├─compiler
	    │          │  ├─cpp
	    │          │  ├─java
	    │          │  ├─javanano
	    │          │  ├─python
	    │          │  └─ruby
	    │          ├─io
	    │          └─stubs
	    └─x64
	        └─Release

```

### Generate `proto` file
Create a bash file named `GeneratePB.bat` under the `3rdparty` folder, write as follow 

``` 
cd /d %~dp0

echo off

set PROTO_PATH=../../src/caffe/proto
set PROTOC="protobuf\x64\Release\protoc"

if exist "%PROTO_PATH%/caffe.pb.h" (
    echo caffe.pb.h remains the same as before
) else (
    echo caffe.pb.h is being generated
    %PROTOC% -I="%PROTO_PATH%" --cpp_out="%PROTO_PATH%" "%PROTO_PATH%/caffe.proto"
)

if exist "%PROTO_PATH%/caffe_pretty_print.pb.h" (
    echo caffe_pretty_print.pb.h remains the same as before
) else (
    echo caffe_pretty_print.pb.h is being generated
    %PROTOC% -I="%PROTO_PATH%" --cpp_out="%PROTO_PATH%" "%PROTO_PATH%/caffe_pretty_print.proto"
)

echo "Done!"
pause

```

Double click it, to get `caffe.*.*` files under `src/caffe/proto/` .

### Additional Files
There are some additional files under `3rdparty\port\` for porting to windows version. You may include then to the project.
```
getopt.c  getopt.h  mkstemp.cpp  mkstemp.h  unistd.h
```

## Build
* Open `caffe.sln`.
* Change the platform from _x64_ to _Build -> Configuration Manager -> Active solution platform -> new -> x64(Win32) -> OK_
* Change lib path to _Additional Library Directories _in _Configuration Properties -> Linker -> General_: (Both Debug and Release)
* Change include path to _Additional Library Directories _in _Configuration Properties -> C/C++ -> General_: (Both Debug and Release)
* Modify `compute_30,sm_30` in _Configuration Properties -> Cuda C++ -> Device -> Code Generation_ upto your device.
* Add lib path to _Additional Library Directories _in _Configuration Properties -> Linker -> General_: (Both Debug and Release) [Change the right version upto your opencv]

```
opencv_core2411.lib
opencv_flann2411.lib
opencv_imgproc2411.lib
opencv_highgui2411.lib
opencv_legacy2411.lib
opencv_video2411.lib
opencv_ml2411.lib
opencv_calib3d2411.lib
opencv_objdetect2411.lib
opencv_stitching2411.lib
opencv_gpu2411.lib
opencv_nonfree2411.lib
opencv_features2d2411.lib
cudart.lib
cuda.lib
nppi.lib
cufft.lib
cublas.lib
curand.lib
gflags.lib
libglog_static.lib
libopenblas.dll.a
libprotobuf.lib
libprotoc.lib
leveldb.lib
lmdb.lib
libhdf5.lib
libhdf5_hl.lib
Shlwapi.lib

```
* Add Flags to _Configuration Properties -> C/C++ -> Command Line _(Both Debug and Release mode) 

```
_CRT_SECURE_NO_WARNINGS
-D_SCL_SECURE_NO_WARNINGS
GOOGLE_GLOG_DLL_DECL=
```

Ok, start build.

### Main Errors may encoutered.

```
open		_open
close		_close
snprintf	sprintf_s
getpid		_getpid
```
_To be continued._
