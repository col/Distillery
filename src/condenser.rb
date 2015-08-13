class Condenser

  attr_accessor :prefix_format

  def initialize(input_lines, prefix_format = /./)
    @input_lines = input_lines
    @prefix_format = prefix_format
    @lines = []
  end

  def condensed_lines
    @input_lines.each do |line|
      if matches_line_prefix?(line) || @lines.empty?
        add_line(line)
      else
        append_line(line)
      end
    end
    @lines
  end

private

  def matches_line_prefix?(line)
    @prefix_format =~ line
  end

  def add_line(line)
    @lines << line unless line.empty?
  end

  def append_line(line)
    @lines.last << line
  end

end