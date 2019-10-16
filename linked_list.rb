class LinkedList
  def initialize(value=nil)
    @head = value
  end

  def add(value)
    self.class.new(value)
  end

  def contains?(value)
    head == value
  end

  def empty?
    !head
  end

  NullNode = Class.new
  Node = Struct.new(:value, :next_node) do
    def initialize(value, next_node=NullNode); super end
  end

  private

  attr_reader :head
end