%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 26. 四月 2018 17:38
%%%-------------------------------------------------------------------
-module(tester).
-author("Administrator").

%% API
-export([
    test/0
    ,test1/0
]).

test() ->
    do_test(5).

do_test(0) -> ok;
do_test(N) ->
    spawn(?MODULE, test1, []) ,
    do_test(N-1).

test1() ->
    case gen_tcp:connect('127.0.0.1', 10086, [binary, {packet, 0}, {active, false}]) of
        {ok, Socket} ->
            loop(Socket, 100);
        _R ->
            io:format("111=====>:~w~n",[_R])
    end.

loop(Sock, N) ->
    timer:sleep(2000),
    case N rem 3 of
        0 ->
            io:format("222=====>:~w~n",[N]),
            gen_tcp:send(Sock, <<N>>);
        _ -> ok
    end,
    loop(Sock, N-1).
