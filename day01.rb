def find_first_part(line)
  line.split('').each do |c|
    return c.to_i if /\A\d\z/.match(c)
  end
end

def find_last_part(line)
  find_first_part(line.reverse)
end

def line_value(line)
  find_first_part(line) * 10 + find_last_part(line)
end

def total_value(lines)
  lines.map { |line| line_value(line) }.inject(:+)
end

input = File.readlines('inputs/day01_part1.txt')
p total_value(input)
