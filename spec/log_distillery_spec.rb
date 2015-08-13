require 'spec_helper.rb'
require_relative '../src/log_distillery.rb'

describe LogDistillery do

  let(:input_path) { File.expand_path(File.join(File.dirname(__FILE__), "fixture/input1.log")) }
  let(:output_path) { File.expand_path(File.join(File.dirname(__FILE__), "fixture/output.log")) }

  before do
    FileUtils.rm(output_path) if File.exists?(output_path)

    @distillery = LogDistillery.new(input_path, output_path, /-/)
  end

  describe "simple filter" do

    it "should output the lines that match the filter to the output.log file" do
      @distillery.add_filter(/1.1/)
      @distillery.distill

      result = File.read(output_path)
      expect(result).to eq "- Line 1\n  Line 1.1\n"
    end

  end

end