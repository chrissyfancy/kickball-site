require "sinatra"
require_relative "models/player"
require_relative "models/team"
require "pry"

get "/" do
  erb :index
end

get "/positions" do
  @positions = Player.positions
  erb :positions
end

get "/positions/:position_name" do
  @position_name = params[:position_name]
  @players_position = []
  TeamData.to_h.each do |team|
    TeamData.to_h[team[0]].each do |position, player|
      if position.downcase == @position_name
        @players_position << player
      end
    end
  end
  erb :position
end

get "/teams" do
  @teams = Team.all
  erb :teams
end

get "/teams/:team_name" do
  @team_positions = []
  @team_name = params[:team_name]
  TeamData.to_h.each do |team|
    if team.include?(@team_name)
      @team_positions << team[1]
    end
  end
  erb :team
end
