# Eigenのビルド，インストール，インクルードディレクトリを定義
set(EIGEN_BUILD_DIR ${CMAKE_BINARY_DIR}/eigen)
set(EIGEN_INSTALL_DIR ${CMAKE_SOURCE_DIR}/eigen)
set(EIGEN_INCLUDE_DIR ${EIGEN_INSTALL_DIR}/include)

include(ExternalProject)
# Eigenを外部プロジェクトとして追加
ExternalProject_Add(
  eigen
  URL http://bitbucket.org/eigen/eigen/get/3.3.4.tar.gz
  PREFIX ${EIGEN_BUILD_DIR}
  # CMakeのconfigureは必要ないので何もさせない
  CONFIGURE_COMMAND ""
  BUILD_COMMAND ""
  INSTALL_COMMAND ""
  TEST_COMMAND ""
  )

# Eigenをダウンロードして解凍してできるフォルダを得る
ExternalProject_Get_Property(eigen SOURCE_DIR)

# 上で得たフォルダ内の指定ディレクトリの中身を別のフォルダにコピーする
ExternalProject_Add_Step(
  eigen
  copySource
  WORKING_DIRECTORY ${SOURCE_DIR}
  COMMAND ${CMAKE_COMMAND} -E copy_directory Eigen ${EIGEN_INCLUDE_DIR}/Eigen
  COMMENT "Copying headers to ${EIGEN_INCLUDE_DIR}/Eigen"
  )

include_directories(SYSTEM ${EIGEN_INCLUDE_DIR})
