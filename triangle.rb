class Triangle
  def initialize(argv)
    normalized_argv = argv.map { |s| s.is_a?(String) ? s.gsub(/,$/, '').to_i : s }
    @argv_a = normalized_argv[0]
    @argv_b = normalized_argv[1]
    @argv_c = normalized_argv[2]
  end

  def pre_condition?
    [@argv_a, @argv_b, @argv_c].find_all { |n| n.is_a?(Numeric) && (n > 0) }.length == 3
  end

  # 三角不等式: 三角形の 2 辺の長さの和は残りの 1 辺の長さよりも大きい
  # https://ja.wikipedia.org/wiki/%E4%B8%89%E8%A7%92%E4%B8%8D%E7%AD%89%E5%BC%8F
  def triangle?
    pre_condition? && @argv_a < @argv_b + @argv_c && @argv_b < @argv_c + @argv_a && @argv_c < @argv_a + @argv_b
  end

  def equilateral_triangle?
    @argv_a == @argv_b && @argv_b == @argv_c && @argv_c == @argv_a
  end

  def isosceles_triangle?
    @argv_a == @argv_b || @argv_b == @argv_c || @argv_c == @argv_a
  end

  def scalene_triangle?
    !isosceles_triangle?
  end

  def detect
    if !triangle?
      puts '三角形じゃないです＞＜'
    elsif equilateral_triangle?
      puts '正三角形ですね！'
    elsif isosceles_triangle?
      puts '二等辺三角形ですね！'
    elsif scalene_triangle?
      puts '不等辺三角形ですね！'
    end
  end

end

if __FILE__ == $0
  Triangle.new(ARGV).detect
end
