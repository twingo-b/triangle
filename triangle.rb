class Triangle
  def initialize(argv)
    normalized_argv = argv.map { |s| s.is_a?(String) ? s.gsub(/,$/, '').to_i : s }
    @args_a = normalized_argv[0]
    @args_b = normalized_argv[1]
    @args_c = normalized_argv[2]
  end

  def pre_condition?
    [@args_a, @args_b, @args_c].find_all { |n| n.is_a?(Numeric) && (n > 0) }.length == 3
  end

  # 三角不等式: 三角形の 2 辺の長さの和は残りの 1 辺の長さよりも大きい
  # https://ja.wikipedia.org/wiki/%E4%B8%89%E8%A7%92%E4%B8%8D%E7%AD%89%E5%BC%8F
  def is_triangle?
    pre_condition? && @args_a < @args_b + @args_c && @args_b < @args_c + @args_a && @args_c < @args_a + @args_b
  end

  def is_equilateral_triangle?
    @args_a == @args_b && @args_b == @args_c && @args_c == @args_a
  end

  def is_isosceles_triangle?
    @args_a == @args_b || @args_b == @args_c || @args_c == @args_a
  end

  def is_scalene_triangle?
    !is_isosceles_triangle?
  end

  def detect
    if !is_triangle?
      puts '三角形じゃないです＞＜'
    elsif is_equilateral_triangle?
      puts '正三角形ですね！'
    elsif is_isosceles_triangle?
      puts '二等辺三角形ですね！'
    elsif is_scalene_triangle?
      puts '不等辺三角形ですね！'
    end
  end

end

if __FILE__ == $0
  Triangle.new(ARGV).detect
end
