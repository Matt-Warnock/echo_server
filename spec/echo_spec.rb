# frozen_string_literal: true

require 'console'
require 'echo'

RSpec.describe Echo do
  let(:output) { StringIO.new }
  let(:exit_text) { described_class::EXIT_TEXT }

  it 'prints a prompt for user' do
    input = StringIO.new(exit_text)
    echo = described_class.new(Console.new(input, output))

    echo.run

    expect(output.string).to include(described_class::PROMPT)
  end

  it 'prints what the user typed' do
    input = StringIO.new("Hello\n#{exit_text}")
    echo = described_class.new(Console.new(input, output))

    echo.run

    expect(output.string).to include('Hello')
  end

  it 'prints what the user again' do
    input = StringIO.new("Hello\n second message\n#{exit_text}")
    echo = described_class.new(Console.new(input, output))

    echo.run

    expect(output.string).to include('second message')
  end

  it 'stops running when user types exit text' do
    input = StringIO.new("Hello\n second message\n#{exit_text}")
    echo = described_class.new(Console.new(input, output))

    echo.run

    expect(output.string).to include(exit_text)
  end

  it 'prompts the user before every user input' do
    input = StringIO.new("Hello\n second message\n#{exit_text}")
    echo = described_class.new(Console.new(input, output))

    echo.run

    expect(output.string.scan(described_class::PROMPT).length).to eq 3
  end
end
