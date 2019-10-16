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
    return self if empty?

    if head.value == value
      rest
    else
      rest.remove(value).add(head.value)
    end
  end

  def contains?(value)
    if empty?
      false
    elsif head.value == value
      true
    else
      rest.contains?(value)
    end
  end

  def empty?
    head.is_a?(NullNode)
  end

  def to_a
    return [] if empty?
    [head.value] + rest.to_a
  end

  NullNode = Class.new
  Node = Struct.new(:value, :next_node) do
    def initialize(value, next_node=NullNode); super end
  end

  private

  attr_reader :head

  def rest
    self.class.new(head.next_node)
  end
end