# Xmlmapper

A declarative mapper from XML documents to ruby objects.

## Installation

Add this line to your application's Gemfile:

    gem 'xmlmapper'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install xmlmapper

## Usage

At first, `extend XMLMapper` in your object class. You can now declare mappings of XML elements to instance variables of your object;
```ruby
map :var_name,  "ELEMENT_NAME"
map :var_name2, "ELEMENT_NAME2", :int
map :pub_date,  "PUB_DATE",      :datetime
```

Here is a sample [XML](http://cal.syoboi.jp/db.php?Command=TitleLookup&TID=200) and [mapped object](https://github.com/na-o-y/syobocal/blob/master/lib/syobocal/db/object/title.rb).

## Contributing

1. Fork it ( http://github.com/<my-github-username>/xmlmapper/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
