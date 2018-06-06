# InSpec Glossary

## Basic Syntax
```
describe foo('/path/to/foo.txt') do
    its('blah') { should cmp '123' }
    it { should exist }
    it { should be_reasonable }
    it { should_not be_ridiculous }
end
```
## Basic Elements:

### describe **foo**, where

  * `foo` is the _resource_

### describe foo **('/path/to/foo.txt')**, where

  * `'/path/to/foo.txt'` is the _resource parameter_

## Tests:

### **its('blah') { should cmp '123' }** is an _individual test_, where

  * `blah` is a _property_
  * { should cmp '123' } is a _condition statement_
  * `should`  is the _condition_
  * `cmp`  is the _matcher_
  * `'123'`  is the _expected result_

### **{ should exist }** is a _condition statement_, where

  * `should`  is the _condition_
  * `exist`  is the _matcher_

### **{ should be\_reasonable }** is a _condition statement_, where
    
  * `should`  is the _condition_
  * `be_reasonable`  is the _matcher_

### **{ should\_not be\_ridiculous }** is a _negative condition statement_, where

  * `should_not`  is the _negative condition_
  * `be_ridiculous`  is the _matcher_

## Plural Syntax

```
describe foos('/path/to/foo.txt', ssl_verify: true).where { name == 'blah' } do
    its('jared') { should cmp >= 123 }
    its('jared.sort.first.monkey') { should be `loud` }
    its(['jared', 'monkey.with.dots']) { should be `loud` }
end
```

## Elements of Plural Resources

### describe **foos**, where

  * `foos` is a _plural resource_.  That means that it specializes in fetching and searching for audit objects in bulk.  The tests it performs will always be in reference to the group of selected audit objects.

### describe foos **('/path/to/foo.txt', ssl_verify: true)**, where

  * `'/path/to/foo.txt'` and `ssl_verify: true` are the _resource parameters_. Resources take zero or more parameters.  Most plural resources do not take any resource  parameters.

## Filters:

### describe foos.**where(name: 'bob')** 

  * `.where(name: 'bob')` is an example of a **filter**. 
  * `(name: 'blah')` is an example of a _filter clause_ using _method syntax_.
  * All plural resources support the `where` filter, in both method and block syntax.
  * Some resources, such as `etc_hosts` are explicitly plural, while others, such as `passwd` are implicitly plural. 

### **{ name =~ /blah/ && has_spots? }** are filter criteria in a filter block

  * `name` =~ `/blah/` selects just those `foo` resources whose name matches `/blah/`.
  * `has_spots?` evaluates to `true` or `false`, and select those `foo` resources where that is true.
  * filter criteria are nearly always named in the singular inflection

## Properties:

Properties on a plural resource are almost always named in the plural inflection, and usually return lists.  Usually their is one entry in the list per selected resource, but some properties de-duplicate the list.

### **their('names') { should include 'jared' }**

  * `their` is an alias for  `its`.  You may use them interchangeably, but `they / their` reads better on plural resources.
  * `names` is the _property_. It is an array of strings.

### **{ should include 'jared' }** is a conditional statement that uses a matcher with an expected value.

  * `include`  is the _matcher_
  * `jared` is the expected value

## Properties with advanced usage:

### Some properties may have advanced usage:
#### **`their ('raw_data.first.keys') { should include 'shoe_size' }`**

  * `raw_data.first.keys` is an example of advanced property usage.  Each dot is evaluated as a method call.  For details, see the documentation of the `rspec-its` gem.
