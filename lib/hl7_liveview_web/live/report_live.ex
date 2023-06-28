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

  # add button clicks to be able to display data here

  ~H"""
  <h1>Report Page</h1>
  Let's show some data
la la la

  <h2>Parse</h2>
  <%= @parse %>

  <h2>Query</h2>
  <%=  %>

  <h3>Choose</h3>
  <%=  %>

  <h3>remove</h3>
  <%=  %>

  <h2>Create</h2>
  <%=  %>
  """
  end

# handle_event
end
