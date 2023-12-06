def load_file
  File.readlines('inputs/day06b.txt').map do |line|
    line.scan(/\d+/).map(&:to_i)
  end
end

def number_of_ways
  total_seconds = load_file[0].join.to_i
  record_distance = load_file[1].join.to_i

  count = 0
  (0..total_seconds).each do |hold_second|
    count += 1 if (total_seconds - hold_second) * hold_second > record_distance
  end
  count
end

p load_file
p number_of_ways
