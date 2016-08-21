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

  def height
    search_segments_without_ids(personal_info, 'Height')
  end

  def weight
    search_segments_without_ids(personal_info, 'Weight').to_i
  end

  def player_url
    "#{URL}/players/" + player_path + '.html'
  end

  def positions
    search_segments_without_ids(personal_info, 'Position').split(' and ')
  end

  def high_school
    search_segments_without_ids(personal_info, 'High School').split(' in').first
  end

  def college
    info_box.at_css("a[href*='college']").text
  end

  def shooting_hand
    search_segments_without_ids(personal_info, 'Shoots')
  end

  def drafted_by
    drafted? ? info_box.css("a[href*='draft']").first.text : 'Undrafted'
  end

  def drafted
    drafted? ? info_box.css("a[href*='draft']").last.text.to_i : 'Undrafted'
  end

  def drafted?
    page.css("a[href*='draft']").any?
  end

  def dob
    info_box.at_css('#necro-birth')['data-birth']
  end
  alias_method :date_of_birth, :dob

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

  #TODO: Make private
  #private

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
    info_box.at_css('.margin_top').text
  end

  def page
    open_webpage(player_url)
  end

  def cleanup_characters(string)
    string.gsub(/\p{Space}/, ' ').delete('▪').strip
  end

  def search_segments_without_ids(node_set, search_string)
    found = false

    node_set.each do |node|
      break cleanup_characters(node.text) if found

      if node.text.include?(search_string)
        found = true
      end
    end
  end

end
