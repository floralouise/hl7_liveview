defmodule Hl7Liveview do
  @moduledoc """
  Hl7Liveview keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

## Examples

# iex> Hl7Liveview.hello()
# :world

  def hello do
    :world
  end

  # Stuff to do with LiveView:

  # Parse a message

  # ex: Hl7Liveview.parse()

  #TO:
  # make this dynamic by number (limit to what's available)

  def parse do
    HL7.Examples.wikipedia_sample_hl7
    |> HL7.Message.to_list()
    |> Enum.at(1)
  end

  # Query a message

    # Messages can be broken into groups using a segment selector (similar to a CSS selector string) that denotes optional and repeating segments in potentially nested hierarchies.

      #     For instance, this would select all textual diagnoses (DG1-3.2) associated with a patient visit (PV1):
      # import HL7.Query
      # HL7.Examples.nist_syndromic_hl7()
      # |> select("PV1 [{DG1}]")
      # |> select("DG1")
      # |> get_parts("3.2")
      # ["Cryptosporidiosis", "Dehydration", "Diarrhea"]

      # ex: Hl7Liveview.choose()

      def choose do
        import HL7.Query
        HL7.Examples.nist_syndromic_hl7()
        |> select("PV1 [{DG1}]")
        |> select("DG1")
        |> get_parts("3.2")
        ["Cryptosporidiosis", "Dehydration", "Diarrhea"]
      end

    # Individual segments can be decomposed using a field selector to reference specific field, repetition, component and subcomponent indices.

      # Alternately, one could select and remove every diagnosis tied to a patient visit and then output a modified HL7 message:

        # iex> import HL7.Query
        # iex> HL7.Examples.nist_syndromic_hl7()
        # ...> |> select("PV1 [{DG1}]")
        # ...> |> select("DG1")
        # ...> |> delete()
        # ...> |> to_string()

        # ex: Hl7Liveview.remove()

        def remove do
          import HL7.Query
          HL7.Examples.nist_syndromic_hl7()
          |> select("PV1 [{DG1}]")
          |> select("DG1")
          |> delete()
          |> to_string()
        end


  # Create a message

    #  HL7 messages can be constructed from scratch with the HL7.Message module. Passing an HL7.Header struct to HL7.Message.new/1 will produce a base message upon which you can add additional segments. These can be appended as list data.

    # The final raw message can be produced by invoking the to_string/1 protocol on either the HL7.Query or HL7.Message structs.

    # Ex: Hl7Liveview.create()

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
