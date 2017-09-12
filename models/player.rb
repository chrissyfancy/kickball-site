require_relative "../lib/team_data"

class Player
  attr_reader :name, :position, :team_name

  def initialize(name, position, team_name)
    @name = name
    @position = position
    @team_name = team_name
  end

  def self.all
    players = []
    JSON_DATA.each do |team, roster|
      roster.each do |position, name|
        players << Player.new(name, position, team)
      end
    end
    players
  end

  def self.positions
    positions = []
    TeamData.to_h.each do |team|
      TeamData.to_h[team[0]].each do |position, player|
        unless positions.include?(position)
          positions << position
        end
      end
    end
    positions
  end
end
