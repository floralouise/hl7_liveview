defmodule Hl7LiveviewWeb.AboutLive do
  use Hl7LiveviewWeb, :live_view

  # mount

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  # render

  def render(assigns) do

    # add button clicks to be able to display data here

    ~H"""
    <h1>About Page</h1>


    """
    end

  # handle_event
  end

