defmodule ChatworkEx.Room do
  alias ChatworkEx.Agent

  def get_rooms do
    base_path()
    |> Agent.get()
  end

  def post_message(room, message) do
    "#{base_path()}/#{room}/messages"
    |> Agent.post(body: message, self_unread: 0)
  end

  defp base_path, do: "/rooms"
end
