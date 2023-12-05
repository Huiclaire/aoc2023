# 1. In each game, count number of color.
  # {:blue=>[3, 6], :red=>[4, 1], :green=>[2, 2]}
# 2. In each color, take the biggest number.
  # {:blue=>[6], :red=>[4], :green=>[2]}
# 3.Multiple the numbers together
  # 6 * 4 * 2 = 48
# 4.Adding up all the numbers
  # 48 + 12 = 60


COLOR_REGEX = { blue: /(\d+) blue/, red: /(\d+) red/, green: /(\d+) green/ }
COLOR_CONSTRAINTS = { blue: 14, red: 12, green: 13 }

result_number = 0

File.readlines('inputs/day02b.txt').each_with_index do |line, idx|
  game_id = idx + 1

  color_count = {}
  COLOR_REGEX.each do |k, v|
    color_count[k] = line.scan(v).flatten.map(&:to_i)
  end

  color_max = {}
  color_count.map do |color, v|
    color_max[color] = v.max
  end

  multiple_number= color_max.values.inject(:*)
  result_number += multiple_number
end
p result_numbers
