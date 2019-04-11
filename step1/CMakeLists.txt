# Cmakeのバージョンを指定
cmake_minimum_required(VERSION 2.8)
# プロジェクト名と使用する言語を設定
project(test_cmake CXX)
# a.outという実行ファイルをmain.cpp,hello.cppから作成
add_executable(a.out main.cpp hello.cpp)

