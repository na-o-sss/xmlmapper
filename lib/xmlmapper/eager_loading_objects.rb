module XMLMapper
  class EagerLoadingObjects
    include Enumerable

    def initialize(elements, loader)
      @elements = elements
      @loader   = loader
    end

    def each
      @elements.each do |element|
        yield @loader.call(element)
      end
    end

  end
end
