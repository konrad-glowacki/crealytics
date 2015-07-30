require File.expand_path('spec_helper', File.dirname(__FILE__))
require 'finder'

RSpec.describe Finder do
  describe ".latest" do
    subject { described_class.latest('performancedata') }

    context "matching files not exist" do
      let(:sorted_results) { [] }

      it 'raises RuntimeError' do
        expect(Dir).to receive(:glob) { sorted_results }

        expect {
          subject
        }.to raise_error(Finder::NoMatchingFiles)
      end
    end

    context "matching files exists" do
      let(:sorted_results) do
        %w(performancedata_2012-10-01_one.txt performancedata_2012-10-11_two.txt performancedata_2012-10-05_three.txt)
      end

      it "returns newest file" do
        expect(Dir).to receive(:glob) { sorted_results }
        expect(subject).to eq('performancedata_2012-10-11_two.txt')
      end
    end
  end
end
