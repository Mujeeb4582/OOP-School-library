require './nameable'

RSpec.describe Nameable do
  describe "#correct_name" do
    it "raises an error" do
      expect { subject.correct_name }.to raise_error(NotImplementedError)
    end
  end
end
