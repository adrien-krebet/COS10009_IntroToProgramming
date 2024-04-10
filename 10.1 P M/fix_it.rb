class MyRecord
    attr_accessor :name, :age
    def initialize(name, age)
      @name = name
      @age = age
    end
end

def compare(a, b, direction)
  result = true
  if (a > b)
    result = true
  else
    result = false
  end

  if (direction)
    return result 
  else
    return !result
  end
end

def is_numeric(obj)
  if /[^0-9]/.match(obj) == nil
    return false
  end
  return true
end

def sort(arr, direction)
  item_count = arr.length 
  for i in (0..item_count - 2)
    for j in ((i + 1)..item_count - 1)
      if (compare(arr[i].age, arr[j].age, direction))
        temp = arr[j]
        arr[j] = arr[i]
        arr[i] = temp
      end
    end
  end
  return arr
end

def read(aFile)
  people = []
  count = aFile.gets
  puts("first line: #{count}")
  if (is_numeric(count))
    count = count.to_i
  else
    count = 0
    puts "Error: first line of file is not a number"
  end

  index = 0
  while (count > index)
    name = aFile.gets
    age = aFile.gets.to_i
    record = MyRecord.new(name, age)
    people << record
    puts "Line read: " + name
    index += 1
  end
  return people
end

def print_array(list)
  puts("Printing list: number of elements: #{list.length}")
  i = 0
  while (i < list.length)
    puts("Name: #{list[i].name} Age: #{list[i].age}")
    i = i + 1
  end
end


def main
  aFile = File.new("data.txt", "r") # open for writing
  people = read(aFile)
  aFile.close

  sorted_people = sort(people, true)
  
  print_array(sorted_people)
end


main
