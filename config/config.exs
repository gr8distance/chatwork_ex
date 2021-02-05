import Config

config :chatwork_ex,
  api_token: System.get_env("CHATWORK_API_TOKEN"),
  endpoint_base_url: "https://api.chatwork.com/v2/"
