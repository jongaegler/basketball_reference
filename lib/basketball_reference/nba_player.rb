require_relative 'client'

class NBAPlayer < Client
  attr_accessor :name, :name_id, :page

  def initialize(name, name_id = '01')
    @name = name.downcase
    @name_id = name_id
    @page = open_webpage(player_url)
  end

  def first_name
    name.split.first
  end

  def last_name
    name.split.last
  end

  def player_url
    "#{URL}/players/" + player_path + '.html'
  end

  private

  def player_path
    "#{last_name[0]}/#{last_name[0..4]}#{first_name[0..1]}#{name_id}"
  end
end
