class Cuboid

  attr_reader :position, :magnitude, :minima, :maxima, :vertices

  def initialize(position, magnitude)
    @position = position || [0, 0, 0]
    @magnitude = magnitude || [1, 1, 1]

    px1 = @position[0]
    px2 = @position[0] + @magnitude[0]
    py1 = @position[1]
    py2 = @position[1] + @magnitude[1]
    pz1 = @position[2]
    pz2 = @position[2] + @magnitude[2]

    @minima = [[px1, px2].min, [py1, py2].min, [pz1, pz2].min]
    @maxima = [[px1, px2].max, [py1, py2].max, [pz1, pz2].max]

    @vertices = [
        [px1, py1, pz1],
        [px1, py1, pz2],
        [px1, py2, pz1],
        [px2, py1, py1],
        [px1, py2, pz2],
        [px2, py2, pz1],
        [px2, py1, pz2],
        [px2, py2, pz2]
    ]
  end

  def move_to(position)
    Cuboid.new(position, @magnitude)
  end

  def self.intersects? (a, b)
    for i in 0..2
      return false if (a.maxima[i] <= b.minima[i]) ||
                      (b.maxima[i] <= a.minima[i])
    end
    true
  end

end
