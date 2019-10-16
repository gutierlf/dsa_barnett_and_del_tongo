require_relative 'linked_list'

RSpec.describe LinkedList do
  it "begins empty" do
    expect(subject).to be_empty
  end

  it "holds data" do
    expect(subject.add("data").contains?("data")).to be true
  end

  it "is not empty when it has data" do
    expect(subject.add("data")).not_to be_empty
  end
end