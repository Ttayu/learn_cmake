# Cmakeのバージョンを指定
cmake_minimum_required(VERSION 2.8)
# プロジェクト名と使用する言語を設定
project(test_cmake CXX)
# コマンドラインビルドオプション
# 親ディレクトリで定義されていればサブディレクトリでも使用される
set(CMAKE_CXX_FLAGS "-O2 -std=c++11 -Wall")

# CMake 3.1以上 CMAKE_CXX_STANDARDを使ってstdを指定できる
# set(CMAKE_CXX_STANDARD 11)

# ビルドの種類によってオプションを変える
# cmake -DCMAKE_BUILD_TYPE=(Debug/Release/MinSizeRel/RelWithDebInfo)
# set(CMAKE_CXX_FLAGS "-O1 -Wall")  # default
# set(CMAKE_CXX_FLAGS_DEBUG "-O0 -g")  # debug
# set(CMAKE_CXX_FLAGS_RELEASE "-O2")  # release
# set(CMAKE_CXX_FLAGS_MINSIZEREL "-Os") # minimum size release
# set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "-Og -g")  # release with debug info

# 現在はGenerator Expressionを使ってtarget_compile_(options/features/definitions)の中で条件分岐を行うことを推奨されている
# target_compile_options(a.out PUBLIC
#   $<$<CONFIG:Release>:-O3>             # Release
#   $<$<CONFIG:Debug>:-O0 -g>            # Debug
#   $<$<CONFIG:RelWithDebgInfo>:-O3 -g>  # RelWithDebInfo
#   )
# target_compile_definitions(a.out PUBLIC
#   $<$<NOT:$<CONFIG:Debug>>:NDEBUG>     # Debug以外
#   )

# CMake 3.8以上 CMAKE_CXX_FLAGSを使わずに
# target_compile_options, target_compile_features, target_compile_definitionsを使うべき
# 最適化・警告等のオプション
# target_compile_options(a.out PUBLIC -O2 -Wall)
# C++11/14/17
# target_compile_features(a.out PUBLIC cxx_std_14)
# マクロ
# target_compile_definitions(a.out PUBLIC NDEBUG _USE_MATH_DEFINES)

# プラットフォーム・コンパイラによってオプションを変更する
# if (APPLE) elseif (WIN32) elseif (LINUX) else end
# Generator Expression
# target_compile_options(a.out PUBLIC
#   # Macの場合
#   $<$<PLATFORM_ID:APPLE>:
#   # ...
#   >
#   # Microsoft Visual Studioの場合
#   $<$<CXX_COMPILER_ID:MSVC>:
#   # ...
#   >
#   )

# サブディレクトリを登録
add_subdirectory(src)
add_subdirectory(test)
