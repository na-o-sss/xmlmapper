require 'rexml/document'
require 'xmlmapper/types'

module XMLMapper
  include Types 

  def load(xml)
    doc = REXML::Document.new(xml)
    objs = []

    REXML::XPath.match(doc, @root_node).each do |element|
      obj = self.new

      @mappings.each do |mapping|
        var = "@" + mapping[:attr].to_s
        val = select_value(element, mapping[:xpath])
        
        # convert value type if specified
        val = self.send(mapping[:type], val) if mapping[:type]

        obj.instance_variable_set(var, val)
      end

      objs << obj
    end

    objs
  end

  private
  def map(attr, xpath, type = nil)
    if attr == nil || 
        !(attr.is_a? Symbol) ||
        xpath == nil
      raise "Illeagal arguments." 
    end

    self.class_eval { attr_reader attr }
    (@mappings ||= []) << { attr: attr, xpath: xpath, type: type }
  end

  def root_node(path)
    @root_node = path
  end

  def select_value(xml, path)
    node = REXML::XPath.match(xml, path)[0]

    # if the node is not a text node or an attribute node, 
    # return the value of the child text node of the node.
    if node.is_a? REXML::Element
      text = node.text
    else
      text = node.value
    end
    text
  rescue 
    nil
  end

end
