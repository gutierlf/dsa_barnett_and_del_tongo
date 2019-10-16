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
    return self if head.is_a?(NullNode)

    rest = self.class.new(head.next_node)
    if head.value == value
      rest
    else
      rest.remove(value).add(head.value)
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

  def to_a
    return [] if empty?
    [head.value] + self.class.new(head.next_node).to_a
  end

  NullNode = Class.new
  Node = Struct.new(:value, :next_node) do
    def initialize(value, next_node=NullNode); super end
  end

  private

  attr_reader :head
end