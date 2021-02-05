defmodule ChatworkEx.Agent do
  alias ChatworkEx.Response

  require IEx

  def get(path, params \\ %{}, headers \\ %{}), do: request(:get, path, params, headers)

  def post(path, params \\ %{}, headers \\ %{}), do: request(:post, path, params, headers)

  defp request(:get, path, params, custom_headers) do
    url = endpoint_url(path) <> URI.encode_query(params)

    HTTPoison.request!(:get, url, "", headers(custom_headers))
    |> Response.new()
  end

  defp request(:post, path, params, custom_headers) do
    url = endpoint_url(path)

    HTTPoison.post!(url, {:form, params}, headers(custom_headers))
    |> Response.new()
  end

  defp headers(custom_headers) do
    custom_headers
    |> Map.put("X-ChatWorkToken", api_token())
  end

  defp api_token, do: Application.get_env(:chatwork_ex, :api_token)

  defp endpoint_url(path), do: endpoint_base_url() <> path

  defp endpoint_base_url, do: Application.get_env(:chatwork_ex, :endpoint_base_url)
end
