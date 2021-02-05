defmodule ChatworkEx.Response do
  defstruct status_code: nil, body: nil, headers: %{}

  def new(http_response) do
    %__MODULE__{
      status_code: http_response.status_code,
      body: Jason.decode!(http_response.body),
      headers: http_response.headers
    }
  end
end
