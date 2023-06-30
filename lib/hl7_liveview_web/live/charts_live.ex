

defmodule Hl7LiveviewWeb.ChartsLive do
  use Hl7LiveviewWeb, :live_view

    def mount(_params, _session, socket) do
      option = %{
        title: %{text: "π", left: "center", top: "center"},
        series: [
          %{
            type: "pie",
            data: [
              %{name: "A", value: 20},
              %{name: "B", value: 50},
              %{name: "C", value: 100}
            ],
            radius: ["40%", "70%"]
          }
        ]
      }

      {:ok, assign(socket, option: option)}
    end

    def render(assigns) do
      ~H"""
      <div id="pie" phx-hook="Chart">
        <div id="pie-chart" style="width: 400px; height: 400px;" />
        <div id="pie-data" hidden></div>
      </div>
      """
    end
  end
