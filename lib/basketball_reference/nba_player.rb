require_relative 'client'

class NBAPlayer < Client
  attr_accessor :name, :name_id

  def initialize(name, name_id = '1')
    @name = name.downcase
    @name_id = name_id
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

  def nicknames
    result = /\((.*)\)/.match(info_box.at_css('.margin_top').content)
    result ? result[1].split(', ') : []
  end

  def nickname
    nicknames.first
  end

  def debuggin
    page
  end

  private

  def player_path
    "#{last_name[0]}/#{last_name[0..4]}#{first_name[0..1]}0#{name_id}"
  end

  def info_box
    page.at_css('#info_box')
  end

  def page
    @page ||= open_webpage(player_url)
  end
end
