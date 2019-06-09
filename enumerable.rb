module Enumerable
  def my_each
    for x in 0 ... self.length do
     yield (self [x])
     end
  end

  def my_each_with_index
    for x in 0 ... self.length do
        yield x 
    end
  end

  def my_select
    a=[]
     self.my_each {
        if yield(j) == true
            a.push(j)
        end
    }
    return a
  end


  def my_all
    self.my_each{ |n|
        return false unless yield(n)
    }
    end
    true
  end

  def my_none
    self.my_each{|n| return true unless yield(n)}
    false  
  end

  def my_count
    count = 0
    self.my_each do |n|
        if yield(n)
            count +=1
        end
    end
    return count
  end

  def my_map
    na=[]
    for x in 0...self.length
        na.push yield x
    end
    if x == proc
        proc.new do |x,n|
            x % self == 0
        end
    end
  end

  def my_inject
    b = self[0]
    self.shift
    self.my_each do |x|
        next if x== 0
        b = yield(b,x)
    end
    b
  end

  def multiply_els(array)
    array.my_inject{|sum,n|
        sum * n}
  end 


=begin
EXAMPLE SET

my_each method working example
array = [2,3,4,5]
p array.my_each {
    |x|
    puts x*2
} 
=end 
=begin
my_each+with_index
a=[1,2,3,4]
a.my_each_with_index {|x| puts x} 
=end
=begin
my map method 
z=[1, 2, 3]
z.my_map do |number|
   puts number * 2
end
=end
=begin
my count method test
str = %w(a bb ccc ddd)
puts str.my_count{|str| str.size > 3}
=end
=begin
num= [1,2,3,4]
num.my_inject {|x,y| 
     puts  x + y}
=end