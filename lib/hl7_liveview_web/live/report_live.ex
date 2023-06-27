defmodule Hl7LiveviewWeb.ReportLive do
use Hl7LiveviewWeb, :live_view

# mount

def mount(_params, _session, socket) do
  # parse =
  socket = assign(socket, parse: Hl7Liveview.parse())
  # socket = assign(socket, brightness: 10)
  {:ok, socket}
end

# render

def render(assigns) do
  ~H"""
  <strong>Let's show some data</strong>
  <%= @parse %>
  """
  end

# handle_event
end
