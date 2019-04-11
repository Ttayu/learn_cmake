# ソースファイルをコンパイルしてオブジェクトファイル（main.o, hello.o）を生成
g++ -c main.cpp hello.cpp
# オブジェクトファイルをリンクしてa.outという実行ファイルを生成
g++ -o a.out main.o hello.o
