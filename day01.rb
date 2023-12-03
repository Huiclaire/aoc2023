TO_NUM = {
  'one' => '1',
  'two' => '2',
  'three' => '3',
  'four' => '4',
  'five' => '5',
  'six' => '6',
  'seven' => '7',
  'eight' => '8',
  'nine' => '9'
}

REGEX = /(?=(\d|one|two|three|four|five|six|seven|eight|nine))/

def to_number(lines)
  lines.map do |line|
    matches = line.scan(REGEX).flatten.each do |element|
      TO_NUM.each do |k, v|
        element.gsub!(k, v)
      end
    end
    matches.join
  end
end

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
  converted_lines = to_number(lines)
  converted_lines.map { |line| line_value(line) }.inject(:+)
end

input = File.readlines('inputs/day01_part1.txt')
p total_value(input)
