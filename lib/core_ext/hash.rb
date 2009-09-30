# Nabbed, http://www.ruby-forum.com/topic/149449
class Hash

  # Returns a new hash with only the given keys.
  def slice(keys = [])
    h = {}
    keys.each do |key|
      raise IndexError if self[key].nil?
      h[key] = self[key]
    end
    h
  end
end