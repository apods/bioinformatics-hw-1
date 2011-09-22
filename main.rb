class DNA
  def initialize(file)
    #read every line in the file
    @dna = IO.readlines(file)
    
    #get individual sizes
    @sizes = @dna[0].split
    
    #convert sizes into an integer
    @sizes.each_index do |i|
      @sizes[i] = @sizes[i].to_i
    end
    
    @dna = @dna[1, num_lines]
    @dna.each_index do |i|
      @dna[i] = @dna[i].chomp
    end
  end
  
  #return the number of DNA strands
  def num_lines
    @sizes[0]
  end
  
  #return the size of each line
  def line_size
    @sizes[1]
  end
  
  #print the DNA strands
  def print
    puts @dna
  end
  
  def all_strands
    @dna
  end
  
  def strand(i)
    @dna[i]
  end
  
  def column(i)
    string = String.new
    @dna.each do |strand|
      string += strand[i].chr
    end
    string
  end
end

class ColumnScore
  attr_reader :a, :c, :g, :t, :min_dist, :current_best
  def initialize
    @a = 0
    @c = 0
    @g = 0
    @t = 0
    @min_dist = 0
    @current_best = "a"
  end
  def inc(letter)
    if letter == 'a'
      @a += 1
      check_current_best(@a)
    elsif letter == 'c'
      @c += 1
      check_current_best(@c)
    elsif letter == 'g'
      @g += 1
      check_current_best(@g)
    elsif letter == 't'
      @t += 1
      check_current_best(@t)
    end
  end
  def check_current_best(just_inc)
    
  end
end

def hamming_distance(v, w)
  v_arr = v.split("")
  w_arr = w.split("")
  return nil unless v_arr.size == w_arr.size
  return nil unless !v_arr.empty?
  
  distance = 0
  v_arr.each_index do |i|
    if v_arr[i] != w_arr[i]
      distance += 1
    end
  end
  distance
end

def total_distance(v, dna)
  return nil unless v.length == dna.line_size
  distance = 0
  strands = dna.all_strands
  strands.each_index do |i|
    distance += hamming_distance(v, strands[i])
  end
  
  distance
end

def decide(column)
  cs = ColumnScore.new
#  for i in 1 .. dna.num_lines
#    if column[i] == 'a'
#      cs.
#    elsif
#      
#    elsif
#      
#    end
#  end
end

filename = ARGV.first || "input1.txt"
puts "Opening " + filename + "..."
dna = DNA.new(filename)

opt = String.new
#for i in 1 .. dna.line_size
#  opt += decide(dna.column(i))
#end
#puts opt
#puts total_distance(opt, dna)












