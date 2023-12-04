# read each line of the file => ["string", "string"]
# give ID to all 5 game => each_with_index
# in ID 1, count total number of blue, red, green
# set up the bag has only 12r, 13gr, 14 blue cubes
# find out which ID has red <= 12, green <= 13, blue <= 14
# add all the ID together


COLOR_REGEX = {blue: /(\d+) blue/, red: /(\d+) red/, green: /(\d+) green/}
COLOR_CONSTRAINTS = {blue: 14, red: 12, green: 13}

result_number = 0

File.readlines('inputs/day02b.txt').each_with_index do |line, idx|
  game_id = idx + 1
  color_count = {}

  COLOR_REGEX.each do |k, v|
    match = line.match(v)
    color_count[k] = line.scan(v).flatten.map(&:to_i).inject(:+)
  end

  color_valid = {}
  COLOR_CONSTRAINTS.each do |k, v|
    color_valid[k] = (color_count[k] <= v)
  end

  game_valid = color_valid.values.all?
  result_number += game_id if game_valid
end
p result_number
