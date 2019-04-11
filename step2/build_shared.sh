# オブジェクトファイル(hello.o, good_morning.o)の作成
g++ -fPIC -c hello.cpp good_morning.cpp
# 共有ライブラリ（libgreetings.so）の作成
g++ -shared hello.o good_morning.o -o libgreetings.so
# main.cppをコンパイルしてlibgreetings.soとリンクし実行ファイルa.outを作成
g++ main.cpp -L. -lgreetings -Xlinker -rpath -Xlinker .
