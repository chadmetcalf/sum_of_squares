# inspired by https://jackmott.github.io/programming/2016/07/22/making-obvious-fast.html

class SumOfSquares
  def each(values)
    sum = 0
    values.each do |n|
      sum += n*n
    end
    sum
  end

  def for(values, sum = 0)
    for n in values do
      sum += n*n
    end
    sum
  end

  def map_reduce(values)
    values.map { |n| n*n }.reduce(0, :+)
  end

  def reduce(values)
    values.reduce(0) do |sum, n|
      sum += n*n
    end
  end

  def sum(values)
    values.sum { |n| n*n }
  end
end
