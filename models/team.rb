require_relative "../lib/team_data"
require "pry"

class Team
  attr_accessor :name, :all_players

  def initialize(team_data)
    @name = team_data[0]
    @players = team_data[1]
  end

  def self.all
    all_teams = []
    TeamData.to_h.each do |team|
      all_teams << Team.new(team)
    end
    all_teams
  end

  def players
    @all_players = []
    TeamData.to_h.each do |position, player|
      @all_players << "#{player}: #{position}"
    end
    @all_players
  end
end
