add_library(greetings SHARED hello.cpp good_morning.cpp)
# greetingsライブラリのインクルードディレクトリ
# PROJECT_SOURCE_DIRはこのプロジェクトのルートディレクトリの絶対パス
# PRIVATE: greetingsにのみ必要
# PUBLIC: greetingsとgreetingsに依存するターゲット(a.out)に必要
# INTERFACE: greetingsに依存するターゲット(a.out)に必要
target_include_directories(greetings PUBLIC ${PROJECT_SOURCE_DIR}/include)
