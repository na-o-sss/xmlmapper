module XMLMapper
  class EagerLoadingObjects
    include Enumerable

    def initialize(xml, root_node, loader)
      @xml       = xml
      @root_node = root_node
      @loader    = loader
    end

    def each
      doc = REXML::Document.new(@xml)
      REXML::XPath.match(doc, @root_node).each do |element|
        yield @loader.call(element)
      end
    end

  end
end
