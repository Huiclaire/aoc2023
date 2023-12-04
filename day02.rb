# read each line of the file => ["string", "string"]
# give ID to all 5 game => each_with_index
# in ID 1, count every set's number of blue, red, green
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
    # color_count[k] = line.scan(v).map(&:to_i).inject(:+)
    color_count[k] = line.scan(v).flatten.map(&:to_i)
  end
  # p color_count # [4, 5, 12]

  color_valid = {}
  COLOR_CONSTRAINTS.each do |k, v|
    color_count.each do |color, num|
      num.each do |n|
        if n <= v
          # p "line:#{color} num:#{n}"
          # p "c:#{k} constraints:#{v}"
          p color_count[k]
          p color
          color_valid[k] = color_count[k]
        end
      end
      # color_valid[k] = (color_count[num] <= v)
    end
  end

  game_valid = color_valid.values.any?
  result_number += game_id if game_valid
end
p result_number
