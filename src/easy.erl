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
-export([add/2, factorial/1, area/3, area/1, speak/1,factorial/2, say_something/2, start_concurrency/2]).

add(X, Y) -> %% Head
  X + Y.     %% Body

factorial(N) when N > 0 ->
  N * factorial(N -1);
factorial(0) ->
  1.

area(Type, N, M) ->
  case Type of
    square -> N * N;
    circle -> math:pi() * N * N;
    triangle -> 0.5 * N * M
end.

area({square, N}) ->
  N * N;
area({circle, R}) ->
  math:pi()*R*R;
area({triangle, B, H}) ->
  0.5*B*H;
area(_)->
  {error, invalidObject}.

speak(Animal) ->
  Talk = if
           (Animal == cat) -> miaow;
           (Animal == dog) -> roofroof;
            true -> invalid
         end,
  io:format("~w says ~w ~n", [Animal, Talk]).

%% Accumulators
factorial(N, TotalFactorial) when N > 0 ->
  factorial(N-1, N*TotalFactorial);
factorial(0, TotalFactorial)->
  TotalFactorial.

say_something(_, 0) ->
  io:format("Done");
say_something(Value, Times) ->
  io:format("~s ~n", [Value]),
  say_something(Value, Times-1).

start_concurrency(Value1, Value2) ->
  spawn(easy, say_something, [Value1, 3]),
  spawn(easy, say_something, [Value2, 3]).