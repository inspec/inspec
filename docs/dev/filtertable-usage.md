# Using FilterTable to write a Resource

## When do I use FilterTable?

FilterTable is intended to help you author "plural" resources.

Plural resources examine platform objects in bulk. For example, sorting through which packages are installed on a system, or which virtual machines are on a cloud provider. You don't know the identifiers of the objects, but you may know some of their properties, and you may want to filter the objects based on those - for example, all processes running more than an hour, or all VMs on a particular subnet.

Singular resources, in contrast, are designed to examine a particular platform object in detail, _when you know an identifier_. For example, you would use a singular resource to fetch a VM by its ID, then interrogate its networking configuration. Singular resources are able to provide richer properties and matchers than plural resources, because the semantics are clearer.

If you can't tell if the resource you are authoring is singular or plural, STOP and consult with a team member. This is a fundamental design question, and while we have had some resources that "straddle the fence" in the past, they are very difficult to use and maintain.

### Should I use FilterTable to represent list properties?

Suppose you have a person, and you want to represent that person's shoes.  Should you use FilterTable for that?

NO.  FilterTable is intended to represent pluralities inherent to the resource itself, not a property of the resource.  So, you would use FilterTable to represent _people_.  To represent shoes, you could have a simple, dumb array-of-strings property on Person.  Or, you could create a new resource, Shoe, or Shoes, which has a person_name or person_id property. Or expose a complex structure as a low-level property, and create mid-level properties/matchers that compute on the values internally (`shoe_fit?`, `has_shoes_for_occasion?('red_carpet')`)

### May I have multiple FilterTable installations on a class?

In theory, yes - that would be used to implement different data fetching / caching strategies.  It is a very advanced usage, and no core resources currently do this, as far as I know.

## Example Usage

Suppose you are writing a resource, `things`.  You want it to behave like any plural resource (we'll explore what that means in a moment).  That is the basic expected behavior of any plural resource.

### How do I declare my interaction with FilterTable?

```ruby

require 'utils/filter'

class Thing < Inspec.resource(1)
  #... other Resource DSL work goes here ...

  # FilterTable setup
  filter_table_config = FilterTable.create
  filter_table_config.add_accessor(:where)
  filter_table_config.add_accessor(:entries)
  filter_table_config.add(:exist?) { |filter_table| !filter_table.entries.empty? }
  filter_table_config.add(:count) { |filter_table| filter_table.entries.count }
  filter_table_config.add(:thing_ids, field: :thing_id)
  filter_table_config.add(:colors, field: :color, type: :simple)
  filter_table_config.connect(self, :fetch_data)
  
  def fetch_data 
    # This method should return an array of hashes - the raw data.  We'll hardcode it here.
    [ 
      { thing_id: 1, color: :red },
      { thing_id: 2, color: :blue, tackiness: 'very' },
      { thing_id: 3, color: :red },
    ]
  end

  def some_other_property
    # We'll examine this later
  end

end
```

Note that all of the methods on `filter_table_config` support chaining, so you will sometimes see it as:
```ruby
  filter_table_config.add_accessor(:where)
                     .add_accessor(:entries)
                     .add(:exist?) { |filter_table| !filter_table.entries.empty? }
```
etc.

## Standard behavior

With a (fairly standard) implementation like that above, what behavior do you get out of the box?

### Your class is still just a Resource class

Nothing special immediately happens to your class or instances of it.  The data fetcher is not called yet.

### Instances of your class can create a specialized FilterTable::Table instance

When most of the following methods are called, it may trigger the instantiation of a FilterTable::Table anonymous subclass.  That instance will have called the raw data fetcher, and will wrap the raw data inside it.  Many of the following methods return the Table instance.

### A `where` method you can call with nil to get the Table

The resource class gains a method, `where`.  If called with a single `nil` param or no params, it will call the data fetcher method, wrap it up, and return the Table instance.  Calling `where` in other modes will do the same thing, but will filter the data.

```ruby
  describe things.where(nil)
    it { should exist }
    its('count') { should cmp 3 }
  end

  # This works, too, but for different internal reasons
  describe things.where
    it { should exist }
    its('count') { should cmp 3 }
  end
```

### A `where` method you can call with hash params, with loose matching

If you call `where` as a method with no block and passing hash params, with keys you know are in the raw data, it will fetch the raw data, then filter row-wise and return the resulting Table.

Multiple criteria are joined with a logical AND.

The filtering is fancy, not just straight equality.

```ruby
  describe things.where(color: :red) do
    its('count') { should cmp 2 }
  end

  # Regexes
  describe things.where(color: /^re/) do
    its('count') { should cmp 2 }
  end

  # It eventually falls out to === comparison
  # Here, range membership 1..2
  describe things.where(thing_id: (1..2)) do
    its('count') { should cmp 2 }
  end

  # Things that don't exist are silently ignored, but do not match
  # See https://github.com/chef/inspec/issues/2943
  describe things.where(none_such: :nope) do
    its('count') { should cmp 0 }
  end

  # irregular rows are supported
  # Only one row has the :tackiness key, with value 'very'.
  describe things.where(tackiness: 'very') do
    its('count') { should cmp 1 }
  end

```

### A `where` method you can call with a block, referencing some fields

You can also call the `where` method with a block. The block is executed row-wise. If it returns truthy, the row is included in the results. Additionally, within the block each field declared with the `add` configuration method is available as a data accessor.

```ruby

  # You can have any logic you want in the block
  describe things.where { true } do
    its('count') { should cmp 3 }
  end

  # You can access any field you declared using `add`
  describe things.where { thing_id > 2 } do
    its('count') { should cmp 1 }
  end
```

### You can chain off of `where` or any other Table without re-fetching raw data

The first time `where` is called, the data fetcher method is called.  `where` performs filtration on the raw data table.  It then constructs a new FilterTable::Table, directly passing in the filtered raw data; this is then the return value from `where`.

```ruby
  # This only calls fetch_data once
  describe things.where(color: :red).where { thing_id > 2 } do
    its('count') { should cmp 1 }
  end
```

Some other methods return a Table object, and they may be chained without a re-fetch as well.

### An `entries` method that will return an array of Structs

The other `add_accessor` call enables a pre-defined method, `entries`.  `entries` is much simpler than `where` - in fact, its behavior is unrelated.  It returns an encapsulated version of the raw data - a plain array, containing Structs as row-entries.  Each struct has an attribute for each time you called `add`.

Overall, in my opinion, `entries` is less useful than `params` (which returns the raw data).  Wrapping in Structs does not seem to add much benefit.

Importantly, note that the return value of `entries` is not the resource, nor the Table - in other words, you cannot chain it. However, you can call `entries` on any Table.

If you call `entries` without chaining it after `where`, calling entries will trigger the call to the data fetching method.

```ruby

  # Access the entries array
  describe things.entries do
    # This is Array#count, not the resource's `count` method
    its('count') { should cmp 3}
  end

  # Access the entries array after chaining off of where
  describe things.where(color: :red).entries do
    # This is Array#count, not the resource's or table's `count` method
    its('count') { should cmp 2}
  end

  # You can access the struct elements as a method, as a hash keyed on symbol, or as a hash keyed on string
  describe things.entries.first.color do
    it { should cmp :red }
  end
  describe things.entries.first[:color] do
    it { should cmp :red }
  end
  describe things.entries.first['color'] do
    it { should cmp :red }
  end
```

### You get an `exist?` matcher defined on the resource and the table

This `add` call:
```ruby
filter_table_config.add(:exist?) { |filter_table| !filter_table.entries.empty? }
```

causes a new method to be defined on both the resource class and the Table class.  The body of the method is taken from the block that is provided.  When the method it called, it will recieve the FilterTable::Table instance as its first parameter.  (It may also accept a second param, but that doesn't make sense for this method - see thing_ids).

As when you are implementing matchers on a singular resource, the only thing that distinuishes this as a matcher is the fact that it ends in `?`.

```ruby
  # Bare call on the matcher (called as a method on the resource)
  describe things do
    it { should exist }
  end

  # Chained on where (called as a method on the Table)
  describe things.where(color: :red) do
    it { should exist }
  end
```

### You get an `count` property defined on the resource and the table

This `add` call:
```ruby
filter_table_config.add(:count) { |filter_table| filter_table.entries.count }
```

causes a new method to be defined on both the resource class and the Table class.  As with `exists?`, the body is taken from the block.

```ruby
  # Bare call on the property (called as a method on the resource)
  describe things do
    its('count') { should cmp 3 }
  end

  # Chained on where (called as a method on the Table)
  describe things.where(color: :red) do
    its('count') { should cmp 2 }
  end
```

### A `thing_ids` method that will return an array of plain values when called without params

This `add` call:
```ruby
filter_table_config.add(:thing_ids, field: :thing_id)
```

will cause a method to be defined on both the resource and the Table. Note that this `add` call does not provide a block; so FilterTable::Factory generates a method body.  The `:field` option specifies which column to access in the raw data (that is, which hash key in the array-of-hashes).

The implementation provided by Factory changes behavior based on calling pattern.  If no params or block is provided, a simple array is returned, containing the column-wise values in the raw data.

```ruby

  # Use it to check for presence / absence of a member
  # This retains nice output formatting - we're testing on a Table associated with a Things resource
  describe things.where(color: :red) do
    its('thing_ids') { should include 3 }
  end

  # Equivalent but with poor formatting - we're testing an anonymous array
  describe things.where(color: :red).thing_ids do
    it { should include 3 }
  end

  # Use as a test-less enumerator
  things.where(color: :red).thing_ids.each do |thing_id|
    # Do something with thing_id, maybe 
    # describe thing(thing_id) do ... 
  end

  # Can be used without where - enumerates all Thing IDs with no filter
  things.thing_ids.each do |thing_id|
    # Do something with thing_id, maybe 
    # describe thing(thing_id) do ... 
  end

```

### A `colors` method that will return a flattened and uniq'd array of values

This method behaves just like `thing_ids`, except that it returns the values of the `color` column.  In addition, the `type: :simple` option causes it to flatten and uniq the array of values when called without args or a block.

```ruby
  # Three rows in the data: red, blue, red
  describe things.colors do
    its('count') { should cmp 2 }
    it { should include :red }
    it { should include :blue }
  end

```

### A `colors` method that can filter on a value and return a Table

You also get this for `thing_ids`.  This is unrelated to `type: :simple` for `colors`.

People definitely use this in the wild.  It reads badly to me; I think this is a legacy usage that we should consider deprecating. To me, this seems to imply that there is a sub-resource (here, colors) we are auditing.

```ruby
  # Filter on colors 
  describe things.colors(:red) do
    its('count') { should cmp 2 }    
  end

  # Same, but doesn't imply we're now operating on some 'color' resource
  describe things.where(color: :red) do
    its('count') { should cmp 2 }  
  end
```

### A `colors` method that can filter on a block and return a Table

You also get this for `thing_ids`.  This is unrelated to `type: :simple` for `colors`.

I haven't seen this used in the wild, but its existence gives me a headache.

```ruby
  # Example A, B, C, and D are semantically the same

  # A: Filter both on colors and the block 
  describe things.colors(:red) { thing_id < 2 } do
    its('count') { should cmp 1 }    
    its('thing_ids') { should include 1 }    
  end

  # B use one where block 
  describe things.where { color == :red && thing_id < 2 } do
    its('count') { should cmp 1 }    
    its('thing_ids') { should include 1 }    
  end

  # C use two where blocks 
  describe things.where { color == :red }.where { thing_id < 2 } do
    its('count') { should cmp 1 }    
    its('thing_ids') { should include 1 }    
  end

  # D use a where param and a where block 
  describe things.where(color: :red) { thing_id < 2 } do
    its('count') { should cmp 1 }    
    its('thing_ids') { should include 1 }    
  end

  # This has nothing to do with colors at all, and may be broken - the lack of an arg to `colors` may make it never match
  describe things.colors { thing_id < 2 } do
    its('count') { should cmp 1 }
  end
```

### You can call `params` on any Table to get the raw data

People _definitely_ use this out in the wild. Unlike `entries`, which wraps each row in a Struct and omits undeclared fields, `params` simply returns the actual raw data array-of-hashes.  It is not `dup`'d.

```ruby
  tacky_things = things.where(color: :blue).params.select { |row| row[:tackiness] }
  tacky_things.map { |row| row[:thing_id] }.each do |thing_id|
    # Use to audit a singular Thing
    describe thing(thing_id) do
      it { should_not be_paisley }
    end
  end
```

### You can call `resource` on any Table to get the resource instance

You could use this to do something fairly complicated.

```ruby
  describe things.where do # Just getting a Table object
    its('resource.some_method') { should cmp 'some_value' }
  end
```

However, the resource instance won't know about the filtration, so I'm not sure what good this does.  Chances are, someone is doing something horrid using this feature in the wild.

## Gotchas and Surprises

### Methods defined with `add` will change their return type based on their call pattern

To me, calling things.thing_ids should always return the same type of value.  But if you call it with args or a block, it not only runs a filter, but also changes its return type to Table.

```ruby

  # This is an Array of color values (symbols, here)
  things.colors

  # This is a FilterTable::Table and these are equivalent
  things.colors(:red) 
  things.where(color: :red)

  # This is a FilterTable::Table and these are equivalent
  things.colors { color == :red } # I think there is a bug here which makes this never match  
  things.where(color: :red)

```

### `entries` will not have fields present in the raw data

`entries` will only know about the fields declared by `add` with `field:`. And...

### `entries` will have things that are not fields

Each time you call `add` - even for things like `count` and `exists?` - that will add an attribute to the Struct that is used to represent a row.  Those attributes will always be nil.

### `add` does not know about what fields are in the raw data

This is because the raw data fetcher is not called until as late as possible.  That's good - it might be expensive - but it also means we can't scan it for columns.  There are ways around that.

### `where` param-mode and raw data access is sensitive to symbols vs strings

### You can't call resource methods on a Table directly

### You can't use a column name in a `where` block unless it was declared as a field using `add`

```ruby
  # This will give a NameError - :tackiness is in the raw
  # data hash but not declared using `add`.
  describe things.where { tackiness == 'very' } do
    its('count') { should cmp 1 }
  end
  # NameError: undefined local variable or method `tackiness' for #<struct :exists?=nil, count=nil, id=nil>

  # But this works:
  describe things.where(tackiness: 'very') do
    its('count') { should cmp 1 }
  end
```

### The eval context of a where block is an anonymous Struct class

You can't get to the resource or the table from there.  (It's the Entry Struct type).

### You can in fact filter for `nil` values

### There is no obvious accessor for the Table instance

You can in fact get the FilterTable::Table instance by calling `where` with no args.  But that is not obvious.

### There is no way to get the FilterTable::Factory object used to configure the resource

Especially while developing in inspec shell, it would be nice to be able to get at the FilterTable::Factory object, perhaps to add more accessors.

