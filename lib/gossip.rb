
require 'csv'

class Gossip
  attr_accessor :author, :content

  def initialize(author, content)
    @content = content
    @author = author
  end

  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@content, @author]
    end
  end

  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end
  
  def self.find(id)
    gossips = self.all
    return gossips[id - 1]
  end
  
end
