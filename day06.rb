# 1. get total seconds => 15s
# 2. get record distance => 40
# 3. hold_seconds = x   # also travel_speed
# 3. left_seconds = 15 - x
# 4. travel_distance = left_seconds * hold), 'travel_distance' must be smaller than 'record_distance"

def load_file
  File.readlines('inputs/day06b.txt').map do |line|
    line.scan(/\d+/).flatten.map(&:to_i)
  end
end

def game_1_run
  total_seconds = load_file[0][0]     # 7
  record_distance = load_file[1][0]   # 9

  results = []
  (0..total_seconds).each do |hold_second|
    if (total_seconds - hold_second) * hold_second > record_distance
      results << hold_second
    end
  end
  total_options = results.count
end


def game_2_run
  total_seconds = load_file[0][1]     # 15
  record_distance = load_file[1][1]   # 40

  results = []
  (0..total_seconds).each do |hold_second|
    if (total_seconds - hold_second) * hold_second > record_distance
      results << hold_second
    end
  end
  total_options = results.count
end

def game_3_run
  total_seconds = load_file[0][2]     # 30
  record_distance = load_file[1][2]   # 200

  results = []
  (0..total_seconds).each do |hold_second|
    if (total_seconds - hold_second) * hold_second > record_distance
      results << hold_second
    end
  end
  total_options = results.count
end

def game_4_run
  total_seconds = load_file[0][3]     # 30
  record_distance = load_file[1][3]   # 200

  results = []
  (0..total_seconds).each do |hold_second|
    if (total_seconds - hold_second) * hold_second > record_distance
      results << hold_second
    end
  end
  total_options = results.count
end

def margin_of_error
  game_1_run * game_2_run * game_3_run * game_4_run
end

p game_1_run
p game_2_run
p game_3_run
p game_4_run
p margin_of_error
