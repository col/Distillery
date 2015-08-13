require_relative 'condenser.rb'

class Distillery

  def initialize(input_lines, line_prefix_format = /./)
    @lines = Condenser.new(input_lines, line_prefix_format).condensed_lines
    @filters = []
  end

  def add_filter(regex)
    @filters << regex
  end

  def distill
    @lines.select do |line|
      @filters.any? { |filter| filter =~ line } || @filters.empty?
    end
  end

end
