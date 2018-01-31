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

  * `('/path/to/foo.txt')` is the _resource parameter_

## Tests:

### **its('blah') { should cmp '123' }** is an _individual test_, where

  * `blah'` is a _property_
  * { should cmp '123' }is a _condition statement_
  * `should`  is the _condition_
  * `cmp`  is the _matcher_
  * `123`  is the _expected result_

### **{ should exist }** is a _condition statement_, where

  * `should`  is the _condition_
  * `exist`  is the _matcher_

### **{ should be\_reasonable }** is a _condition statement_, where
    
  * `should`  is the _condition_
  * `be_reasonable`  is the _matcher_

### **{ should\_not be\_ridiculous }** is a _negative condition statement_, where

  * `should_not`  is the _negative condition_
  * `be_ridiculous`  is the _matcher_

## Advanced Syntax

```
describe foos('/path/to/foo.txt', ssl_verify: true).where { names == 'blah' } do
    its('jared') { should cmp >= 123 }
    its('jared.sort.first.monkey') { should be `loud` }
    its(['jared', 'monkey.with.dots']) { should be `loud` }
end
```

## Advanced Elements:

### describe **foos**, where

  * `foos` is a _plural resource_

### describe foos **('/path/to/foo.txt', ssl_verify: true)**, where

  * `('/path/to/foo.txt', ssl_verify: true)` are the _resource parameters_. Resources take one or more parameters.

## Filters:

### describe **foos('/path/to/foo.txt', ssl_verify: true)** where { names == 'blah' } do

  * `('/path/to/foo.txt', ssl_verify: true)` are the _resource parameters_. Resources take one or more parameters.
  * Note: Filters are used on plural resources

### **where  { names == 'blah' }** is an example of a **filter**. Some resources support one or more filters.

  * `where  { names == 'blah' }` is an example of a _filter clause_ 

### **{ names == 'blah' , has spots}** are filter criteria

  * `names` compares output to `blah`
  * `has spots` evaluates to `true` or `false`

## Properties:

### **its('jared') { should cmp >= 123 }**

  * `jared` is the _property_
  * 
### **{ should cmp >= 123 }** is a conditional statement that uses a matcher with an operator and expected value.

  * `cmp`  is the _matcher_
  * `>=` is the operator (some matchers accept operators)
  * `123` is the expected value

## Properties with advanced usage:

### Some properties may have advanced usage:
#### **its `('jared.sort.first.monkey') { should be `loud` }**

  * `jared.sort.first.monkey` is an example of the `jared` property with an advanced usage
