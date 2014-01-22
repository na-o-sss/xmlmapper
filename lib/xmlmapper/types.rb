require "date"

module XMLMapper
  module Types
    def int(str)
      str.to_i rescue nil
    end

    def datetime(str)
      DateTime.parse(str) rescue nil
    end
  end
end
