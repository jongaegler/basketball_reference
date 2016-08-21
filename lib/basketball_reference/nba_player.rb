require_relative 'client'

class NBAPlayer < Client
  attr_accessor :name, :name_id

  def initialize(name, name_id = '1')
    @name = name.downcase
    @name_id = name_id
    raise 'Player not found' if page == false
  end

  def first_name
    name.split.first.capitalize
  end

  def last_name
    name.split.last.capitalize
  end

  def player_url
    "#{URL}/players/" + player_path + '.html'
  end

  def positions
    search_segments_without_ids(personal_info, 'Position')
    found = false

    personal_info.each do |segment|
      break segment.text if found

      if segment.text.contains?('Position')
        found = true
      end
    end
  end

  def dob
    info_box.at_css('#necro-birth')['data-birth']
  end

  def nicknames
    result = /\((.*)\)/.match(name_line)
    result ? result[1].split(', ') : []
  end

  def nickname
    nicknames.first
  end

  def twitter_handle
    name_line.include?('Twitter') ? name_line.split.last : nil
  end

  def debuggin
    page
  end

  private

  def player_path
    "#{last_name[0]}/#{last_name[0..4]}#{first_name[0..1]}0#{name_id}".downcase
  end

  def info_box
    @info_box ||= page.at_css('#info_box')
  end

  def personal_info
    info_box.at_css('.padding_bottom_half').children
  end

  def name_line
    info_box.at_css('.margin_top').content
  end

  def page
    @page ||= open_webpage(player_url)
  end

  def search_segments_without_ids(node_set, search_string)
    found = false

    node_set.each do |node|
      break node.text if found

      if node.text.contains?('Position')
        found = true
      end
    end
  end

end
