def decide(column, num_lines)
  cs = ColumnScore.new
  for i in 0 .. num_lines - 1
    nucleotide = column[i].chr
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
  cs.curr_best[0]
end

def first_best(dna)
  opt = ""
  for i in 0 .. dna.line_length - 1
    opt += decide(dna.column(i), dna.num_lines)
  end
  Array.[](max_distance(opt, dna), opt)
end

def majority(column, num_lines)
  cs = ColumnScore.new
  for i in 0 .. num_lines - 1
    nucleotide = column[i].chr
    if column[i] == ?A
      cs.inc_a
      if cs.a > num_lines/2
        return "A"
      end
    elsif column[i] == ?C
      cs.inc_c
      if cs.c > num_lines/2
        return "C"
      end
    elsif column[i] == ?G
      cs.inc_g
      if cs.g > num_lines/2
        return "G"
      end
    elsif column[i] == ?T
      cs.inc_t
      if cs.t > num_lines/2
        return "T"
      end
    end
  end
  nil
end
