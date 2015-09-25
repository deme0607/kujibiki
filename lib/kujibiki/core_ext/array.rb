class Array
  alias_method :_sample, :sample
  def sample(n = 1, random: nil, weight: nil)
    return _sample(n, random: random) unless weight

    unless weight.select {|w| w > 0}.size == n
      raise ArgumentError, "weight size must be equal to sample number(#{n})"
    end

    sum = weight.inject(0.0, :+)
    normalized_hash = self.each_with_object({}).with_index do |(e, h), i|
      h[e] = weight[i] / sum
    end

    pick_max = 1.0
    sampled = n.times.map do
      pick = random ? random.rand(0..pick_max) : rand(0..pick_max)

      e, weight = normalized_hash.find do |e, weight|
        (pick <= weight) || ((pick -= weight) && false)
      end

      pick_max -= weight
      normalized_hash[e] = 0 and e
    end

    sampled.size > 1 ? sampled : sampled.first
  end
end
