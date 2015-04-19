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
