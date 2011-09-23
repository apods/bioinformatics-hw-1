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
  attr_reader :a, :c, :g, :t, :current_best
  def initialize
    @a = 0
    @c = 0
    @g = 0
    @t = 0
    @current_best = ["a", @a]
  end
  def inc_a
    @a += 1
    check_best(@a, "a")
  end
  def inc_c
    @c += 1
    check_best(@c, "c")
  end
  def inc_g
    @g += 1
    check_best(@g, "g")
  end
  def inc_t
    @t += 1
    check_best(@t, "t")
  end
  def check_best(num, nucleotide)
    if @current_best[1] < num
      @current_best[0] = nucleotide
      @current_best[1] = num
    end
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

def decide(column, num_lines)
  cs = ColumnScore.new
  for i in 1 .. num_lines
    if column[i] == ?A
      cs.inc_a
    elsif column[i] == ?C
      cs.inc_c
    elsif column[i] == ?G
      cs.inc_g
    elsif column[i] == ?T
      cs.inc_t
    end
  end
  cs.current_best[0]
end

filename = ARGV.first || "input1.txt"
puts "Opening " + filename + "..."
dna = DNA.new(filename)

opt = String.new
size = dna.line_size
for i in 0 .. size - 1
  opt += decide(dna.column(i), dna.num_lines)
end
puts opt
puts total_distance(opt, dna)












