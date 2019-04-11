cd src
# オブジェクトファイル(hello.o, good_morning.o)の作成
g++ -fPIC -c hello.cpp good_morning.cpp -I../include
# 共有ライブラリ（libgreetings.so）の作成
g++ -shared *.o -o libgreetings.so
cd ../test
# main.cppをコンパイルしてlibgreetings.soとリンクし実行ファイルa.outを作成
g++ main.cpp -I../include -L../src -lgreetings -Xlinker -rpath -Xlinker ../src
