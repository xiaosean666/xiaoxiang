#!/usr/bin/env bash

function make() {
    erl -eval "make:all()" -s c q
}

function start() {
    rm -rf ./ebin/tcp_app.app
    cp ./src/tcp_app.app.src ./ebin/tcp_app.app
    cd ./ebin/
    werl -name '123@127.0.0.1' -setcookie abc -s tcp_app start &
    cd ..
}

function test(){
    cd ./ebin/
    werl -name '321@127.0.0.1' -setcookie abc -s tester test &
    cd ..
}

function do_id() {
    erl -eval "make:all()" -s c q
    rm -rf ./ebin/tcp_app.app
    cp ./src/tcp_app.app.src ./ebin/tcp_app.app
    cd ./ebin/
    werl -name '123@127.0.0.1' -setcookie abc -s tcp_app start &
    werl -name '321@127.0.0.1' -setcookie abc -s tester test &
}


$1

exit 0