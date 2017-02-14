require 'date'

def load_people
  lines = File.read("./people.csv").split("\n")
  @keys = lines.shift.split(",")
  rows = lines.map { |line| line.split(",") }
  rows.map { |row| build_person(row) }
end

def build_person(row)
  @keys.each_with_object({}).with_index do |(key, hash), index|
    hash[key] = row[index]
  end
end

def count_by_gender
  groups = @people.group_by { |person| person["gender"] }
  groups.each do |key, val|
    groups[key] = val.count
  end
end

def select_young
  @people.select do |person|
    Date.parse(person["dob"]).year > 2000
  end
end

@people = load_people

puts count_by_gender
puts select_young.count
