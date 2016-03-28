class Array
  alias_method :_sample, :sample
  def sample(n=nil, random: nil, weight: nil)
    unless weight
      if n
        if random
          return _sample(n, random: random)
        else
          return _sample(n)
        end
      else
        if random
          return _sample(random: random)
        else
          return _sample
        end
      end
    end

    unless weight.select {|w| w > 0}.size >= self.size
      raise ArgumentError, "weight size must be larger than or equal to sample number(#{self.size})"
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
