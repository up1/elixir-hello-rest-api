FROM elixir:1.8.2
RUN mix local.hex --force 
RUN mix local.rebar --force