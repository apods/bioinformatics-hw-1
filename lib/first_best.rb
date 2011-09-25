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

