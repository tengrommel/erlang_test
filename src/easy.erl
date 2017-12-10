%%%-------------------------------------------------------------------
%%% @author lu
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 10. 十二月 2017 22:19
%%%-------------------------------------------------------------------
-module(easy).
-author("lu").

%% API
-export([add/2, factorial/1]).

add(X, Y) -> %% Head
  X + Y.     %% Body

factorial(N) when N > 0 ->
  N * factorial(N -1);
factorial(0) ->
  1.