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
