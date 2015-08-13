require 'spec_helper.rb'
require_relative '../src/condenser.rb'

describe Condenser do

  let(:input_lines) {
    [
      "- line 1\n",
      "  line 1.1\n",
      "- line 2\n",
    ]
  }

  before do
    @condenser = Condenser.new(input_lines)
  end

  context "without a prefix format set" do

    it "should output the lines un-condensed" do
      result = @condenser.condensed_lines
      expect(result).to eq input_lines
    end

  end

  context "with a prefix format set" do

    before do
      @condenser.prefix_format = /-/
    end

    it "should output the lines condensed" do
      result = @condenser.condensed_lines
      expect(result).to eq ["- line 1\n  line 1.1\n", "- line 2\n"]
    end

  end

end