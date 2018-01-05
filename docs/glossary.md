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
#### Basic Elements:
* describe **`foo`**
    * **`foo`** is the _`resource`_

* describe foo **`('/path/to/foo.txt')`**
   *  **`('/path/to/foo.txt')`** is the _`resource parameter`_

#### Tests:
* **`its('blah') { should cmp '123' }`**  is an _`individual test`_
    * **`{ should cmp '123' }`** is a _`condition statement`_
    * **`should`** is the `condition`
    * **`cmp`** is the `matcher`
    * **`123`** is the `expected` result

* **`{ should exist }`** is a _`condition statement`_
    * `should` is the condition
    * `exist` is the matcher

* **`{ should be_reasonable }`** is a _`condition statement`_
    * **`should`** is the _`condition`_
    *  **`be_reasonable`** is the _`matcher`_

* **`{ should_not be_ridiculous }`** is a _`negative condition statement`_
    * **`should_not`** is the _`negative condition`_
    * **`be_ridiculous`** is the _`matcher`_

## Advanced Syntax
```
describe foos('/path/to/foo.txt', ssl_verify: true).where { names == 'blah' } do
    its('jared') { should cmp >= 123 }
    its('jared.sort.first.monkey') { should be "loud" }
    its(['jared', 'monkey.with.dots']) { should be "loud" }
end
```

#### Advanced Elements:
* describe **foos**
    * **`foos`** is a _`plural resource`_
* describe foos **('/path/to/foo.txt', ssl_verify: true)**
    * `('/path/to/foo.txt', ssl_verify: true)` are the resource parameters. Resources take one or more parameters.

#### Filters:
* describe foos('/path/to/foo.txt', ssl_verify: true).**where { names == 'blah' }** do
    * `('/path/to/foo.txt', ssl_verify: true)` are the resource parameters. Resources take one or more parameters.
    * Filters are used on _plural_ resources
   *  **`where  { names == 'blah' }`** is an example of a *`filter`*. Some resources support one or more filters.
   *  **`where  { names == 'blah' }`**  example of a filter clause [research SQL terms for this.]
   *  **`{ names == 'blah' , has spots}`** are filter criteria
        *  `names` compares output to 'blah'
        *  `has spots` evaluates to 'true' or 'false'

#### Properties:
* **its('jared') { should cmp >= 123 }**
    * **`jared`** is the _`property`_
    * { should cmp >= 123 } is a conditional statement that uses a matcher with an operator and expected value.
        * **`cmp`** is the _`matcher`_
        * **`>=`** is the _`operator`_ (some matchers accept operators)
        * **`123`** is the _`expected value`_

#### Properties with advanced usage:
* some properties may have advanced usage:
    * its **`('jared.sort.first.monkey') { should be "loud" }`**
       * **`jared.sort.first.monkey`** is an example of the **`jared`** property with some advanced usage
    * **`its(['jared', 'monkey.with.dots') { should be "loud" }`**
       * another example of the **`jared`** property with some advanced usage