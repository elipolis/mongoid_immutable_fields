module Mongoid
  module Dirty

    # returns changed fields as symbols instead of elements
    def changed_as_symbols
      changed_as_sym = []
      changed.each { |c| changed_as_sym << c.to_sym if c.is_a? String }
      changed_as_sym
    end

  end

end