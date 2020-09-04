# frozen_string_literal: true

require 'console'

RSpec.describe Console do
  it 'writes to the terminal output' do
    output = StringIO.new
    console = described_class.new(nil, output)
    console.write('the white rabbit')

    expect(output.string).to eq('the white rabbit')
  end

  it 'writes a line to the termimal output' do
    output = StringIO.new
    console = described_class.new(nil, output)
    console.write_line('the white rabbit')

    expect(output.string).to eq("the white rabbit\n")
  end

  it 'reads from the termimal input' do
    input = StringIO.new("hello\n")
    console = described_class.new(input, nil)

    expect(console.read).to eq('hello')
  end

  it 'reads a line from the termimal input' do
    input = StringIO.new("hello\n")
    console = described_class.new(input, nil)

    expect(console.read_line).to eq("hello\n")
  end
end
