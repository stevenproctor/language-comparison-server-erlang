-module(language_comparison_server_erlang_app).
-behaviour(application).

-export([start/2]).
-export([stop/1]).

start(_Type, _Args) ->
    Dispatch = cowboy_router:compile([
        {'_', [{"/", simple_json_payload_handler, []}]}
    ]),
    cowboy:start_http(my_http_listener, 100, [{port, 9292}],
        [{env, [{dispatch, Dispatch}]}]
    ),
	language_comparison_server_erlang_sup:start_link().

stop(_State) ->
	ok.
