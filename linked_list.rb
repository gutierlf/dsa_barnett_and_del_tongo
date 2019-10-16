class LinkedList
  def initialize(value=NullNode.new)
    @head =
      case value
      when NullNode
        NullNode.new
      when Node
        value
      else
        Node.new(value)
      end
  end

  def add(value)
    self.class.new(Node.new(value, head))
  end

  def remove(value)
    if head.value == value
      self.class.new(head.next_node)
    end
  end

  def contains?(value)
    if head.is_a?(NullNode)
      false
    elsif head.value == value
      true
    else
      self.class.new(head.next_node).contains?(value)
    end
  end

  def empty?
    head.is_a?(NullNode)
  end

  NullNode = Class.new
  Node = Struct.new(:value, :next_node) do
    def initialize(value, next_node=NullNode); super end
  end

  private

  attr_reader :head
end