# frozen_string_literal: true

class Echo
  PROMPT = 'Type anything to me and I\'ll repeat it (type "exit" to end program): '
  EXIT_TEXT = "exit\n"

  def initialize(console)
    @console = console
  end

  def run
    loop do
      console.write(PROMPT)
      text = console.read_line
      console.write_line(text)
      break if text == EXIT_TEXT
    end
  end

  private

  attr_reader :console
end
