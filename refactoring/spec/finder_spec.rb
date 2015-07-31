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
        %w(project_2012-10-01_performancedata.txt project_2012-10-11_performancedata.txt project_2012-10-05_performancedata.txt)
      end

      it "returns newest file" do
        expect(Dir).to receive(:glob) { sorted_results }
        expect(subject).to eq('project_2012-10-11_performancedata.txt')
      end
    end
  end
end
