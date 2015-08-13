require 'spec_helper.rb'
require_relative '../src/distillery.rb'

describe Distillery do

  describe "distill" do

    before do
      @input = [
        "- Line 1\n",
        "  Line 1.1\n",
        "- Line 2\n"
      ]
      @distillery = Distillery.new(@input, /-/)
    end

    describe "with no filters" do

      it "should return all the input, condensed using the line prefix provided" do
        result = @distillery.distill

        expect(result).to eq(["- Line 1\n  Line 1.1\n", "- Line 2\n"])
      end

    end

    describe "with a single filter" do

      it "should only return condensed lines that match the filter" do
        @distillery.add_filter(/1.1/)
        result = @distillery.distill

        expect(result).to eq(["- Line 1\n  Line 1.1\n"])
      end

    end

    describe "with multiple filters" do

      it "should return condensed lines that match any of the filters" do
        @distillery.add_filter(/1.1/)
        @distillery.add_filter(/2/)
        result = @distillery.distill

        expect(result).to eq(["- Line 1\n  Line 1.1\n", "- Line 2\n"])
      end

    end

  end

end