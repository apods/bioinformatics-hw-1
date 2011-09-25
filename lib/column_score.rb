class ColumnScore
  attr_reader :a, :c, :g, :t, :curr_best
  def initialize
    @a = 0
    @c = 0
    @g = 0
    @t = 0
    @curr_best = ["A", @a]
  end
  def inc_a
    @a += 1
    check_best(@a, "A")
  end
  def inc_c
    @c += 1
    check_best(@c, "C")
  end
  def inc_g
    @g += 1
    check_best(@g, "G")
  end
  def inc_t
    @t += 1
    check_best(@t, "T")
  end
  def check_best(num, nucleotide)
    if @curr_best[1] < num
      @curr_best[0] = nucleotide
      @curr_best[1] = num
    end
  end
end
