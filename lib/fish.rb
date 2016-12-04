class Fish
  attr_accessor :mood, :count
  attr_reader :name


  def initialize(name)
    @name = name
    @mood = "nervous"
    @count = 0
    @count += 1
  end

  def count
    @count
  end
end
