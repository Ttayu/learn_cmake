# オブジェクトファイル(hello.o, good_morning.o)の作成
g++ -c hello.cpp good_morning.cpp
# 静的ライブラリ(libgreetings.a)の作成
ar rvs libgreetings.a hello.o good_morning.o
# main.cppをコンパイルしてlibgreetings.aとリンクし実行ファイルa.outを作成
g++ main.cpp libgreetings.a
