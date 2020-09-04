# frozen_string_literal: true

class Console
  def initialize(input, output)
    @input = input
    @output = output
  end

  def write(text)
    output.print(text)
  end

  def write_line(text)
    output.puts(text)
  end

  def read
    input.gets.chomp
  end

  def read_line
    input.gets
  end

  private

  attr_reader :input, :output
end
