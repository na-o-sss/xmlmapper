require 'rexml/document'
require 'xmlmapper/types'
require 'xmlmapper/util'
require 'xmlmapper/eager_loading_objects'

module XMLMapper

  def load(xml)
    doc = REXML::Document.new(xml)
    objs = []

    REXML::XPath.match(doc, @root_node).each do |element|
      objs << load_singular(element)
    end

    objs
  end

  def load_singular(element)
    obj = self.new

    @mappings.each do |mapping|
      var = "@" + mapping[:attr].to_s
      val = Util.select_value(element, mapping[:xpath])

      # convert value type if specified
      val = Types.send(mapping[:type], val) if mapping[:type]

      obj.instance_variable_set(var, val)
    end
    obj
  end

  def eager_load(xml)
    EagerLoadingObjects.new(xml, @root_node, 
                           ->(element) { load_singular(element) })
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

end
