require_relative 'linked_list'

RSpec.describe LinkedList do
  it "begins empty" do
    expect(subject).to be_empty
  end
end