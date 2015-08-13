require_relative 'distillery.rb'

class LogDistillery

  def initialize(input_path, output_path, prefix_format)
    input_lines = File.readlines(input_path)
    @distillery = Distillery.new(input_lines, prefix_format)
    @output_path = output_path
  end

  def add_filter(regex)
    @distillery.add_filter(regex)
  end

  def distill
    output = @distillery.distill
    write_to_output_file(output)
    output
  end

  private

  def write_to_output_file(output)
    return unless @output_path
    File.open(@output_path, 'w') do |file|
      output.each { |line| file.write(line) }
    end
  end

end
