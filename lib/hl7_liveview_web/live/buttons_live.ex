defmodule Hl7LiveviewWeb.ButtonsLive do
  use Hl7LiveviewWeb, :live_view

  # mount

  def mount(_params, _session, socket) do
    {:ok, socket
          |> assign_segment_index()
          |> assign_message()
          |> assign_message_list()}
  end

  def assign_segment_index(socket) do
    assign(socket, segment_index: 0)
  end

  def assign_message(socket) do
    assign(socket, message: Hl7Liveview.message())
  end

  def assign_message_list(socket) do
    assign(socket, message_list: Hl7Liveview.message_list(socket.assigns.message))
  end

  # render

  def render(assigns) do

    ~H"""
      <h2 class="flex items-center gap-4 font-semibold leading-6 text-zinc-900">🆒 Button clicks</h2>
      <p>- HL7 messages can be fully parsed into lists of lists and strings to provide a compact representation of the message structure.</p>

      <p>- Use the buttons to view each segment of the message.
      <i>(first, second, third...)</i></p>
      <p class="text-[2rem] mt-4 font-semibold leading-10 tracking-tighter text-zinc-900">
Original message:</p>
      <pre><%= @message %>
      </pre>
      <div class="text-[2rem] mt-4 font-semibold leading-10 tracking-tighter text-zinc-900">
      Segment: <%= @segment_index %>
      </div>

      <button phx-click="down" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded" disabled={@segment_index == 0}>
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
        <path stroke-linecap="round" stroke-linejoin="round" d="M9 12.75l3 3m0 0l3-3m-3 3v-7.5M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
        </svg>
        </button>

        <button phx-click="up" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
          <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
          <path stroke-linecap="round" stroke-linejoin="round" d="M15 11.25l-3-3m0 0l-3 3m3-3v7.5M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
          </svg>
        </button>

        <div class="mt-10 flex items-center text-sm font-semibold leading-6" style="color: #D90368">

        <%= display_segment(@segment_index, @message_list) %>

        </div>


    """
    end

    def display_segment(number, message_list) do
      Hl7Liveview.grab_segment(number, message_list)
      |> inspect(pretty: true)
    end

  # handle_event


def handle_event("up", _, socket) do
  socket = update(socket, :segment_index, &(&1 + 1))
  {:noreply, socket}
end

def handle_event("down", _, socket) do
  socket = update(socket, :segment_index, &(&1 - 1))
  {:noreply, socket}
end

  end
