require File.expand_path('spec_helper', File.dirname(__FILE__))
require 'modifier'

RSpec.describe Modifier do
  let(:saleamount_factor) { 1 }
  let(:cancellation_factor) { 0.4 }
  let(:input_filename) { File.dirname(__FILE__) + '/fixtures/performancedata_example.txt' }
  let(:output_filename) { input_filename + '.sorted' }

  subject { described_class.new(saleamount_factor, cancellation_factor) }

  after { File.delete(output_filename) }

  describe "#sort" do
    it "returns filename with sorted rows by Clicks values" do
      expect(subject.sort(input_filename)).to eq(output_filename)
    end
  end

  describe "#modify" do
    let(:result_filename) { File.dirname(__FILE__) + '/fixtures/performancedata_example_0.txt' }

    after { File.delete(result_filename) }

    it "modifies input filename" do
      subject.modify(input_filename, input_filename)
      expect(File).to exist(result_filename)
    end
  end
end
