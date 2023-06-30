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
    <h1>Forms!</h1>
<form>

</form>

    """
    end

  # handle_event
  end
