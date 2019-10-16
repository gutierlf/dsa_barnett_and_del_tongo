require_relative 'linked_list'

RSpec.describe LinkedList do
  subject(:empty_list) { LinkedList.new }
  
  it "begins empty" do
    expect(empty_list).to be_empty
  end

  it "holds data" do
    expect(empty_list.add("data").contains?("data")).to be true
  end

  it "is not empty when it has data" do
    expect(empty_list.add("data")).not_to be_empty
  end

  it "holds multiple entries" do
    linked_list = empty_list.add("first").add("second")
    expect(linked_list.contains?("first")).to be true
    expect(linked_list.contains?("second")).to be true
  end

  it "allows data removal from empty list" do
    expect(empty_list.remove("not present")).to be_empty
  end

  it "allows data removal from head" do
    expect(empty_list.add("data").remove("data").contains?("data")).to be false
    first_and_second = empty_list.add("first").add("second")
    first = first_and_second.remove("second")
    expect(first.contains?("second")).to be false
    expect(first.contains?("first")).to be true
  end

  it "allows data removal from non-head positions" do
    first_and_second = empty_list.add("first").add("second")
    second = first_and_second.remove("first")
    expect(second.contains?("first")).to be false
    expect(second.contains?("second")).to be true
  end

  it "responds to #to_a" do
    expect(empty_list.to_a).to eq []
    first_and_second = empty_list.add("first").add("second")
    expect(first_and_second.to_a).to eq %w(second first)
  end
end

describe LinkedList::Node do
  it "has a value" do
    expect(LinkedList::Node.new(5).value).to eq 5
  end

  it "points to another node" do
    expect(LinkedList::Node.new(5, LinkedList::Node.new(6)).next_node.value).to eq 6
  end

  it "starts pointing to NullNode" do
    expect(LinkedList::Node.new(5).next_node).to eq LinkedList::NullNode
  end
end

