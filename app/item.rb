class Item
  @@all = []
  attr_accessor :name, :price

  def initialize(name,price)
    @name = name
    @price = price
    @@all << self
  end

  def self.all
    @@all
  end

  def self.item_price_by_name(search)
    found_item = Item.all.find{|item| item.name == search}
    #binding.pry
    if found_item 
      return found_item.price
    else
      return false
    end
  end


end
