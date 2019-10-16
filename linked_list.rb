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

  private

  attr_reader :head
end