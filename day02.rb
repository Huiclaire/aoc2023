COLOR_REGEX = { blue: /(\d+) blue/, red: /(\d+) red/, green: /(\d+) green/ }
COLOR_CONSTRAINTS = { blue: 14, red: 12, green: 13 }

result_number = 0

File.readlines('inputs/day02b.txt').each_with_index do |line, idx|
  game_id = idx + 1

  color_count = {}
  COLOR_REGEX.each do |k, v|
    # color_count[k] = line.scan(v).map(&:to_i).inject(:+)
    color_count[k] = line.scan(v).flatten.map(&:to_i)
  end

  color_valid = {}
  COLOR_CONSTRAINTS.each do |color, constraint|
    color_valid[color] = color_count[color].map do |n|
      n <= constraint
    end
  end

  result = color_valid.values.map(&:all?)
  game_valid = result.all?
  result_number += game_id if game_valid

  p "#{game_id}: #{game_valid}"
  p result_number
end
