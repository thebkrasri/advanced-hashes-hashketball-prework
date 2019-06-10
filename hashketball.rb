require "pry"

def good_practices
  game_hash.each do |location, team_data|

    binding.pry
    team_data.each do |attribute, data|

      binding.pry

      data.each do |data_item|
          binding.pry
      end
    end
  end
end

# Write your code here!
def game_hash()
  newGame = {
    home:
    {:team_name => "Brooklyn Nets", :colors => ["Black","White"], :players =>
      {"Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    away: 
    {
      :team_name => "Charlotte Hornets", :colors => ["Turquoise", "Purple"], :players => 
        {"Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismack Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Kemba Walker" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
  return newGame
end

def num_points_scored(player)
  return get_player_stat(player, :points)
  return stat
end

def shoe_size(player)
  return get_player_stat(player, :shoe)
end

def team_colors(team)
  return get_team_stat(team, :colors)
end

def team_names()
  newGame = game_hash
  arr = []
  newGame.each do |key,value|
    arr.push(value[:team_name])
  end  
  return arr
end

def player_numbers(team)
  get_players_stats(team, :number)
end

def player_stats(player)
  newGame = game_hash
  newGame.each do |key,value|
    if value[:players].include?(player)
      return value[:players][player]
    end
  end
end

def big_shoe_rebounds()
  max_shoe = 0
  biggest_foot = ""
  newGame = game_hash
  newGame.each do |key,value|
     value[:players].each do |key, value|
     s = get_player_stat(key, :shoe)
     if s > max_shoe
      max_shoe = s
      biggest_foot = key
     end
    end
  end
  return get_player_stat(biggest_foot,:rebounds)
end

def most_points_scored()
  max_points = 0
  scorer = ""
  newGame = game_hash
  newGame.each do |key,value|
     value[:players].each do |key, value|
     s = get_player_stat(key, :points)
     if s > max_points
      max_points = s
      scorer = key
     end
    end
  end
  return scorer
end

def winning_team()
  scoreHash = {}
  newGame = game_hash
  newGame.each do |key,value|
    team_name = value[:team_name]
    scoreHash[team_name] = 0
     value[:players].each do |key, value|
     scoreHash[team_name] += value[:points]
    end
  end
  p scoreHash
  max_points = 0
  winning_team = ""
  scoreHash.each do |k,v| 
    if v> max_points
      max_points = v
      winning_team = k
    end
  end
  return winning_team
end

def player_with_longest_name()
  player = ""
  newGame = game_hash
  newGame.each do |key,value|
     value[:players].each do |key, value|
     if key.length > player.length
      player = key
     end
    end
  end
  return player
end

def long_name_steals_a_ton?()
    max_steals = 0
  scorer = ""
  newGame = game_hash
  newGame.each do |key,value|
     value[:players].each do |key, value|
     s = get_player_stat(key, :steals)
     if s > max_steals
      max_steals = s
      scorer = key
     end
    end
  end
  return get_player_stat(player_with_longest_name, :steals) >= max_steals
end
#helper methods
def get_player_stat(player, stat)
  newGame = game_hash
  newGame.each do |key,value|
    if value[:players].include?(player)
      return value[:players][player][stat]
    end
  end
end

def get_team_stat(team, stat)
  newGame = game_hash
  newGame.each do |key,value|
    if value[:team_name] == team
      return value[stat]
    end
  end
end

def get_players_stats(team, stat)
newGame = game_hash
stats_arr = []
  newGame.each do |key,value|
    if value[:team_name] == team
      value[:players].each do |key, value|
        stats_arr.push(value[stat])
      end
    end
  end
  return stats_arr
end









