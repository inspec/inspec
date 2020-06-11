# frozen_string_literal: true

RSpec.describe TTY::Reader, '#subscribe' do
  let(:input)  { StringIO.new }
  let(:output) { StringIO.new }
  let(:env)    { { "TTY_TEST" => true } }

  it "subscribes to receive events" do
    stub_const("Context", Class.new do
      def initialize(events)
        @events = events
      end

      def keypress(event)
        @events << [:keypress, event.value]
      end
    end)

    reader = TTY::Reader.new(input: input, output: output, env: env)
    events = []
    context = Context.new(events)
    reader.subscribe(context)

    input << "aa\n"
    input.rewind
    answer = reader.read_line

    expect(answer).to eq("aa\n")
    expect(events).to eq([
      [:keypress, "a"],
      [:keypress, "a"],
      [:keypress, "\n"]
    ])

    events.clear

    reader.unsubscribe(context)

    input.rewind
    answer = reader.read_line
    expect(events).to eq([])
  end

  it "subscribes to listen to events only in a block" do
    stub_const("Context", Class.new do
      def initialize(events)
        @events = events
      end

      def keypress(event)
        @events << [:keypress, event.value]
      end
    end)

    reader = TTY::Reader.new(input: input, output: output, env: env)
    events = []
    context = Context.new(events)

    input << "aa\nbb\n"
    input.rewind

    reader.subscribe(context) do
      reader.read_line
    end
    answer = reader.read_line

    expect(answer).to eq("bb\n")
    expect(events).to eq([
      [:keypress, "a"],
      [:keypress, "a"],
      [:keypress, "\n"]
    ])
  end
end
