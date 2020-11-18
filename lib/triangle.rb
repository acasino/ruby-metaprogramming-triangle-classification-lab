class Triangle
  # write code here
  #equilateral = all sides equal
  #isosceles triangles have  two sides equal
  #scalene no sides equal

  attr_reader :first, :second, :third

  def initialize(first, second, third)
    @first = first
    @second = second
    @third = third
  end

  #kind returns type of triangle: equilateral, isoceles, scalene
  def kind
    validate_triangle
    if first == second && second == third
      :equilateral
    elsif first == second || second == third || first == third
      :isosceles
    else
      :scalene
    end
  end

  def validate_triangle
    #error if two sides sum don't exceed third side: triangle inequality
    #error if side < 0
    real_triangle = [(first + second > third), ( first+ third > second), (second + third > first)]
    [first, second, third].each do |side|
      real_triangle << false if side <= 0
    raise TriangleError if real_triangle.include?(false)
    end
  end

  class TriangleError < StandardError
  end

end
