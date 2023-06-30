defmodule Hl7Liveview do
  @moduledoc """
  Hl7Liveview keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

    # These are taken from the library readme here: https://github.com/HCA-Healthcare/elixir-hl7/blob/master/README.md

    # Parse: Small reducer functions to choose segment number

    def message do
      HL7.Examples.wikipedia_sample_hl7()
    end

    def message_list(message \\ message()) do
      HL7.Message.to_list(message)
    end

    def grab_segment(number, message_list \\ message_list()) do
      message_list
      |> Enum.at(number)
    end


  # Parse examples
  def segment do
    HL7.Examples.wikipedia_sample_hl7
    |> HL7.Message.to_list()
    |> Enum.at(0)
  end

  def field_value do
    HL7.Examples.nist_immunization_hl7()
    |> HL7.Message.find("RXA")
    |> HL7.Segment.get_part(5, 1, 2)
  end

  def get_value do
    HL7.Examples.nist_immunization_hl7()
    |> HL7.Message.find("RXA")
    |> HL7.Segment.get_part(5, 1, 2)
  end


  # Query example: Select

      def choose do
        import HL7.Query
        HL7.Examples.nist_syndromic_hl7()
        |> select("PV1 [{DG1}]")
        |> select("DG1")
        |> get_parts("3.2")
        ["Cryptosporidiosis", "Dehydration", "Diarrhea"]
      end

    # Query example: Remove

        def remove do
          import HL7.Query
          HL7.Examples.nist_syndromic_hl7()
          |> select("PV1 [{DG1}]")
          |> select("DG1")
          |> delete()
          |> to_string()
        end


  # Create example

def create() do
  header = %HL7.Header{
    message_type: "ADT",
    trigger_event: "A01",
    sending_facility: "XYZHospC",
    sending_application: "MegaReg",
    receiving_facility: "XYZImgCtr",
    receiving_application: "SuperOE",
    message_date_time: "20060529090131-0500",
    security: "",
    message_control_id: "01052901",
    processing_id: "P",
    separators: %HL7.Separators{
      field: "|",
      component: "^",
      field_repeat: "~",
      escape_char: "\\",
      subcomponent: "&",
      encoding_characters: "^~\\&",
      delimiter_check: ["&", "^", "~"],
      truncation_char: ""}}
  HL7.Message.new(header)
end

end
