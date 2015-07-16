-module(simple_json_payload_handler).
-behaviour(cowboy_http_handler).

-export([init/3]).
-export([handle/2]).
-export([terminate/3]).

-record(state, {
}).

init(_, Req, _Opts) ->
	{ok, Req, #state{}}.

handle(Req, State=#state{}) ->
	{ok, Req2} = getReply(Req),
	{ok, Req2, State}.

terminate(_Reason, _Req, _State) ->
	ok.

getReply(Req) ->
    cowboy_req:reply(200,
        [{<<"content-type">>, <<"application/json">>}],
        [getJSON(), <<"\n">>],
        Req).

getJSON() ->
    jsx:encode(getResponseMap()).

getResponseMap() ->
    #{name => <<"Language Comparison">>,
      pi => math:pi(),
      best_number => 27,
      right_now => calendar:universal_time()}.

