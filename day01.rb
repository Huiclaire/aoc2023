# 1. look through array ["twoLnine", "eightwothree"]
# 2. scan the word matching to number, and take the first and last word => "eight", "three"
# 3. replace "eight", "three" with "8", "3"

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

# def letters_to_number(line)
#   line.map do |word|
#     TO_NUM.each do |k, v|
#       matches = word.scan(REGEX)
#       word.gsub!(k, v)
#     end
#     word
#   end
# end

def to_number(lines)
  lines.map do |line|
    line.scan(REGEX).each do |group|
      # find first and last number with letter in an array, conver it into digit.
    end
  end
end

lines = ["two1nine", "eightwothree", "abcone2threexyz", "xtwone3four", "4nineeightseven2"]
p to_number(lines)
# [[["two"], ["1"], ["nine"]],
# [["eight"], ["two"], ["three"]],
# [["one"], ["2"], ["three"]]
# [["two"], ["one"], ["3"], ["four"]],
# [["4"], ["nine"], ["eight"], ["seven"], ["2"]]]

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
