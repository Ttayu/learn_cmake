# ExternalProject_Add: ビルドに必要なライブラリを自動的にダウンロードしてビルドする
# ExternalProject_Add(<target name> [<option> ...])

# Githubからダウンロード(eg. GoogleTest)
# ---
cmake_minimum_required(VERSION 2.8)
# ExternalProject_Addを使えるようにする
include(ExternalProject)

# GoogleTestをビルドするディレクトリを指定
set(GTEST_BUILD_DIR ${CMAKE_BINARY_DIR}/gtest)
# GoogleTestをインストールするディレクトリを指定
set(GTEST_INSTALL_DIR ${PROJECT_SOURCE_DIR}/gtest)
# GoogleTestのヘッダファイルがあるディレクトリ
set(GTEST_INCLUDE_DIR ${GTEST_INSTALL_DIR}/include)
# GoogleTestの静的ライブラリがあるフォルダ
set(GTEST_LIB_DIR ${GTEST_INSTALL_DIR}/lib)

# GoogleTestは`pthread`が必要なのでCMakeに探してもらう
find_package(Threads REQUIRED)

# GoogleTestを外部プロジェクトとして追加
ExternalProject_Add(googletest
    # ダウンロードするURLを指定
    URL https://github.com/google/googletest/archive/release-1.8.0.tar.gz
    # GoogleTestをビルドするディレクトリを指定
    PREFIX ${GTEST_BUILD_DIR}
    # GoogleTestをダウンロードして解凍したあと，CMakeを実行するときに渡される引数
    # 今回の場合, `cmake -DCMAKE_INSTALL_PREFIX=...`と同等
    # cmakeで元々定義されている変数(CMAKE_CXX_FLAGS)やライブラリで定義されている変数を利用可能
    # 引数の頭に`-D`を与えることを忘れずに
    CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=${GTEST_INCLUDE_DIR}
  )

# GoogleTestにgtestとう名前をつけ外部の(このプロジェクトでビルド方法を定義しない)静的ライブラリとして登録
# 静的ライブラリとして登録
add_library(gtest IMPORTED STATIC GLOBAL)
# gtestに対応する静的ライブラリのファイルとその依存ライブラリpthreadを指定
set_target_properties(gtest PROPERTIES
  IMPORTED_LOCATION ${GTEST_LIB_DIR}/libgtest.a
  INTERFACE_LINK_LIBRARIES ${CMAKE_THREAD_LIBS_INIT}
  )

# gtest_mainも必要な場合はadd_libraryからset_target_propertiesまでの
# gtestをgtest_mainに書き換えて追加する

# それぞれのライブラリで独自に指定している変数を知りたければそれぞれのライブラリのルートディレクトリでcmake -Lとする
