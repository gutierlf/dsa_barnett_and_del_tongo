class LinkedList
  attr_reader :head

  def initialize(value=nil)
    @head = value
  end

  def add(value)
    self.class.new(value)
  end

  def empty?
    !head
  end
end