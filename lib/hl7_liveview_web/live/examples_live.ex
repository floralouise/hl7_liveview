defmodule Hl7LiveviewWeb.ExamplesLive do
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
      <h1 class="text-[2rem] mt-4 font-semibold leading-10 tracking-tighter text-zinc-900">LiveView Examples</h1>
      Here's a blurb about what this is and why I did it.
    <h2 class="flex items-center gap-4 font-semibold leading-6 text-zinc-900">Intro</h2>

    <h2 class="flex items-center gap-4 font-semibold leading-6 text-zinc-900">🆒 Button clicks</h2>

      Query: select
      Query: remove

    <h2 class="flex items-center gap-4 font-semibold leading-6 text-zinc-900">📝 Interactive forms</h2>

    <p> Parse: grab segment # with Enum<br>
        Parse: get field value with get parts</p>

    <h2 class="flex items-center gap-4 font-semibold leading-6 text-zinc-900">⌨️  Key events</h2>

    Create

    <h2 class="flex items-center gap-4 font-semibold leading-6 text-zinc-900">📈 Components</h2>

        components = dashboard with fake data

    <h2 class="flex items-center gap-4 font-semibold leading-6 text-zinc-900">📊 Dynamic Charts</h2>
    apache charts with animation (link to blog post). https://twitter.com/moomerman/status/1670021284900614144?s=20

    <h2 class="flex items-center gap-4 font-semibold leading-6 text-zinc-900">🧪Add a test here, too</h2>
    hey look it's a test!
  """
  end



# handle_event
end
