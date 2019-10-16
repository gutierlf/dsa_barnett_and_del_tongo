class LinkedList
  def initialize(value=nil)
    @head =
      case value
      when nil
        NullNode
      when Node
        value
      else
        Node.new(value)
      end
  end

  def add(value)
    self.class.new(Node.new(value, head))
  end

  def contains?(value)
    if head == NullNode
      false
    elsif head.value == value
      true
    else
      self.class.new(head.next_node).contains?(value)
    end
  end

  def empty?
    head == NullNode
  end

  NullNode = Class.new
  Node = Struct.new(:value, :next_node) do
    def initialize(value, next_node=NullNode); super end
  end

  private

  attr_reader :head
end