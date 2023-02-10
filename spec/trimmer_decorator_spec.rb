require './trimmer_decorator'

describe TrimmerDecorator do
  let(:nameable) { double("Nameable", correct_name: "Very long name") }
  subject(:trimmer) { TrimmerDecorator.new(nameable) }

  describe "#correct_name" do
    it "returns the first 10 characters of the name" do
      expect(trimmer.correct_name).to eq("Very long ")
    end
  end
end
