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

