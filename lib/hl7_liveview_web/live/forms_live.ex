defmodule Hl7LiveviewWeb.FormsLive do
  use Hl7LiveviewWeb, :live_view

  # mount

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  # render

  def render(assigns) do

    # add button clicks to be able to display data here

    ~H"""
    <h2 class="flex items-center gap-4 font-semibold leading-6 text-zinc-900">Forms!</h2>
Reference:<br>
- <a href="https://fly.io/phoenix-files/liveview-multi-select/" style="color:blue" target="blank">A reusable Multi-Select component for Phoenix LiveView</a><br>
- <a href="https://hexdocs.pm/phoenix_live_view/Phoenix.Component.html#form/1" style="color:blue" target="blank">Phoenix forms docs</a>


    """
    end

  # handle_event
  end
