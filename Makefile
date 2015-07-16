PROJECT = language_comparison_server_erlang
DEPS = cowboy jsx erlware_commons
dep_jsx = git https://github.com/talentdeficit/jsx v2.6.2
dep_erlware_commons = git https://github.com/erlware/erlware_commons v0.15.0
include erlang.mk
