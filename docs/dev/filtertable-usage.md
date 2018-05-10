# Using FilterTable to write a Resource

## When do I use FilterTable?

FilterTable is intended to help you author "plural" resources.

Plural resources examine platform objects in bulk. For example, sorting through which packages are installed on a system, or which virtual machines are on a cloud provider. You don't know the identifiers of the objects, but you may know some of their properties, and you may want to filter the objects based on those - for example, all processes running more than an hour, or all VMs on a particular subnet.

Singular resources, in contrast, are designed to examine a particular platform object in detail, _when you know an identifier_. For example, you would use a singular resource to fetch a VM by its ID, then interrogate its networking configuration. Singular resources are able to provide richer properties and matchers than plural resources, because the semantics are clearer.

If you can't tell if the resource you are authoring is singular or plural, STOP and consult with a team member. This is a fundamental design question, and while we have had some resources that "straddle the fence" in the past, they ar very difficult to use and maintain.

### Should I use FilterTable to represent list properties?

Suppose you have a person, and you want to represent that person's shoes.  Should you use FilterTable for that?

NO.  FilterTable is intended to represent pluralities inherent to the resource, not a property of the resource.  So, you would use FilterTable to represent _people_.  To represent shoes, you could have a simple, dumb array-of-strings property on Person.  Or, you could create a new resource, Shoe, or Shoes, which has a person_name or person_id property. Or expose a complex structure as a low-level property, and create mid-level properties/matchers that compute on the values internally (`shoe_fit?`, `has_shoes_for_occasion?('red_carpet')`)

### May I have multiple FilterTable installations on a class?

In theory, yes - that would be used to implement different data fetching / caching strategies.  It is a very advanced usage, and no core resources currently do this, as far as I know.

## Example Usage

Suppose you are writing a resource, `things`.  You want it to behave like any plural resource (we'll explore what that means in a moment).  That is the basic expected behavior of any plural resource.

### How do I declare my interaction with FilterTable?

```ruby

require 'utils/filter'

class Thing < Inspec.resource(1)
  #... other Resource DSL work

  filter_table_config = FilterTable.create
  filter_table_config.add_accessor(:where)
  filter_table_config.add_accessor(:entries)
  filter_table_config.add(:exist?) { |filter_table| !filter_table.entries.empty? }
  filter_table_config.add(:thing_ids, field: :thing_id)
  filter_table_config.add(:colors, field: :color, type: :simple)
  filter_table_config.connect(self, :fetch_data)
  
  def fetch_data 
    # This method should return an array of hashes - the raw data.  We'll hardcode it here.
    [ 
      { thing_id: 1, color: :red },
      { thing_id: 2, color: :blue, size: 'big' },
      { thing_id: 2, color: :red },
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

Nothing special immediately happends to your class or instances of it.  The data fetcher is not called yet.

### Instances of your class can create a specialized FilterTable::Table instance

When most of the following methods are called, it may trigger the instantiation of a FilterTable::Table anonymous subclass.  That instance will have called the raw data fetcher, and will wrap the raw data inside it.  Many of the following methods return the Table instance.

### A `where` method you can call with nil to get the Table

The resource class gains a method, `where`.  If called with a single `nil` param or no params, it will call the data fetcher method, wrap it up, and return the Table instance.  Calling `where` in other modes will do the same thing, but will filter the data.

```ruby
  describe things.where(nil)
    it { should exist }
    its('entries.count') { should cmp 3 }
  end

  # This works, too, but for different internal reasons
  describe things.where
    it { should exist }
    its('entries.count') { should cmp 3 }
  end
```

### A `where` method you can call with hash params

If you call `where` as a method with no block and passing hash params, with keys you know are in the raw data, it will fetch the raw data, then filter row-wise and return the resulting Table.

```ruby
  describe things.where(nil)
    it { should exist }
    its('entries.count') { should cmp 3 }
  end

  # This works, too, but for different internal reasons
  describe things.where
    it { should exist }
    its('entries.count') { should cmp 3 }
  end
```


### A `where` method you can call with a block, referencing some fields


### You can chain off of `where` without re-fetching raw data

### You get an `exist?` matcher defined on the resource

### An `entries` method that will return an array of Structs

### A `thing_ids` method that will return an array of plain values

### A `thing_ids` method that can filter on a value and return a Table

### A `thing_ids` method that can filter on a block and return a Table

### A `colors` method that will return a flattened and uniq'd array of values


### You can call `params` on any Table to get the raw data

### You can call `resource` on any Table to get the resource instance

### The Table will have methods defined on it as well

## Gotchas and Surprises

### Methods defined with `add` will change their return type based on their call pattern

### `entries` will not have fields present in the raw data

### `entries` will have things that are not fields

### `add` does not know about what fields are in the raw data

### Raw data access is sensitive to symbols vs strings

### You can't call resource methods on a Table directly

### You can't use a column name in a `where` block unless it was declared as a field using `add`

### You can in fact filter for `nil` values