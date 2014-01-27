module XMLMapper
  module Util
    class << self
      
      def select_value(xml, path)
        node = REXML::XPath.match(xml, path)[0]

        # if the node is not a text node or an attribute node, 
        # return the value of the child text node of the node.
        if node.is_a? REXML::Element
          return node.text
        else
          return node.value
        end
      rescue 
        nil
      end

    end
  end
end
