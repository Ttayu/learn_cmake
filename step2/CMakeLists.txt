# Cmakeのバージョンを指定
cmake_minimum_required(VERSION 2.8)
# プロジェクト名と使用する言語を設定
project(test_cmake CXX)

# hello.cppとgood_morning.cppをコンパイルして静的ライブラリlibgreetings.aを作成
# 実際にはSTATIC/SHAREDは無指定にするべき
# cmake -DBUILD_SHARED_LIBS=ON .. (default OFF)
# add_library(greetings STATIC hello.cpp good_morning.cpp)
# add_library(greetings SHARED hello.cpp good_morning.cpp)
# GREETINGS_BUILD_SHARED_LIBSというオプションを作成
option(GREETINGS_BUILD_SHARED_LIBS "build greetings as a shared library" OFF)

if (GREETINGS_BUILD_SHARED_LIBS)
  add_library(greetings SHARED hello.cpp good_morning.cpp)
else()
  add_library(greetings STATIC hello.cpp good_morning.cpp)
endif()
# a.outという実行ファイルをmain.cpp,hello.cppから作成
add_executable(a.out main.cpp)
# a.outを作成する際にlibgreetings.aをリンク
target_link_libraries(a.out greetings)

