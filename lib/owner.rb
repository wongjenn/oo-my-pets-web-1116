require 'pry'

class Owner
  include Enumerable
  attr_accessor :pets, :name, :count
  attr_reader :species
  @@all = []
  @@count = 0

  def self.all
    @@all
  end

  def self.count
    @@count
  end

  def self.reset_all
    @@all.clear
    @@count = 0
  end

  def initialize(species)
    @species = species
    @pets = {:fishes => [], :dogs => [], :cats => []}
    @@all << self
    @@count += 1
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_fish(name)
    self.pets[:fishes] << Fish.new(name)
    self.pets[:fishes].count
    # binding.pry
  end

  def buy_cat(name)
    self.pets[:cats] << Cat.new(name)
  end

  def buy_dog(name)
    self.pets[:dogs] << Dog.new(name)
  end

  def walk_dogs
    self.pets[:dogs].each { |dog| dog.mood = "happy" }
  end

  def play_with_cats
    self.pets[:cats].each { |cat| cat.mood = "happy"}
  end

  def feed_fish
    self.pets[:fishes].each { |fish| fish.mood = "happy" }
  end

  def sell_pets
    self.pets.each do |type, pet|
      pet.each_with_index do |p, idx|
        self.pets[type][idx].mood = "nervous"
      end
    end
    self.pets.clear
  end

  def list_pets
    fish_count = 0
    dog_count = 0
    cat_count = 0
    self.pets.each do |type, pet|
      case type.to_s
      when 'fishes'
        fish_count = pet.length
      when "dogs"
        dog_count = pet.length
      when "cats"
        cat_count = pet.length
      end
    # binding.pry
    end
    "I have #{fish_count} fish, #{dog_count} dog(s), and #{cat_count} cat(s)."
  end

end
