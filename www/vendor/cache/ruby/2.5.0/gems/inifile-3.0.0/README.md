inifile [![Build Status](https://secure.travis-ci.org/TwP/inifile.png)](http://travis-ci.org/TwP/inifile)
=======

This is a native Ruby package for reading and writing INI files.


Description
-----------

Although made popular by Windows, INI files can be used on any system thanks
to their flexibility. They allow a program to store configuration data, which
can then be easily parsed and changed. Two notable systems that use the INI
format are Samba and Trac.

More information about INI files can be found on the [Wikipedia Page](http://en.wikipedia.org/wiki/INI_file).

### Properties

The basic element contained in an INI file is the property. Every property has
a name and a value, delimited by an equals sign *=*. The name appears to the
left of the equals sign and the value to the right.

    name=value

### Sections

Section declarations start with *[* and end with *]* as in `[section1]` and
`[section2]` shown in the example below. The section declaration marks the
beginning of a section. All properties after the section declaration will be
associated with that section.

### Comments

All lines beginning with a semicolon *;* or a number sign *#* are considered
to be comments. Comment lines are ignored when parsing INI files.

### Example File Format

A typical INI file might look like this:

    [section1]
    ; some comment on section1
    var1 = foo
    var2 = doodle
    var3 = multiline values \
    are also possible

    [section2]
    # another comment
    var1 = baz
    var2 = shoodle


Implementation
--------------

The format of INI files is not well defined. Several assumptions are made by
the **inifile** gem when parsing INI files. Most of these assumptions can be
modified at, but the defaults are listed below.

### Global Properties

If the INI file lacks any section declarations, or if there are properties
decalared before the first section, then these properties will be placed into
a default "global" section. The name of this section can be configured when
creating an `IniFile` instance.

### Duplicate Properties

Duplicate properties are allowed in a single section. The last property value
set is the one that will be stored in the `IniFile` instance.

    [section1]
    var1 = foo
    var2 = bar
    var1 = poodle

The resulting value of `var1` will be `poodle`.

### Duplicate Sections

If you have more than one section with the same name then the sections will be
merged. Duplicate properties between the two sections will follow the rules
discussed above. Properties in the latter section will override properties in
the earlier section.

### Comments

The comment character can be either a semicolon *;* or a number sign *#*. The
comment character can appear anywhere on a line including at the end of a
name/value pair declaration. If you wish to use a comment character in your
value then you will need to either escape the character or put the value in
double quotations.

    [section1]
    var1 = foo  # a comment
    var2 = "foo # this is not a comment"
    var3 = foo \# this is not a comment either

### Multi-Line Values

Values can be continued onto multiple lines in two separate ways. Putting a
slash at the end of a line will continue the value declaration to the next
line. When parsing, the trailing slash will be consumed and **will not**
appear in the resulting value. Comments can appear to the right of the
trailing slash.

    var1 = this is a \  # these comments will
    multiline value     # be ignored by the parser

In the above example the resulting value for `var1` will be `this is a
multiline value`. If you want to preserve newline characters in the value then
quotations should be used.

    var2 = "this is a
    multiline value"

The resulting value for `var2` will be `this is a\nmultiline value`.

### Escape Characters

Several escape characters are supported within the **value** for a property.
These escape sequences will be applied to quoted and unquoted values alike.
You can enable or disable escaping by setting the **escape** flag to true or
false when creating an IniFile instance.

* \0 -- null character
* \n -- newline character
* \r -- carriage return character
* \t -- tab character
* \\\\ -- backslash character

The backslash escape sequence is only needed if you want one of the escape
sequences to appear literally in your value. For example:

    property = this is not a tab \\t character

### Value Type Casting

Some values will be type cast when parsed by the code. Those values are
booleans, integers, floats, and empty strings are cast to `nil`.

* ""  -->  nil
* "42"  -->  42
* "3.14159"  -->  3.14159
* "true"  -->  true
* "false"  -->  false
* "normal string"  -->  "normal string"

Pretty basic stuff.

Install
-------

    gem install inifile


Testing
-------

To run the tests:

    $ rake


Examples
--------

    require 'inifile'
    myini = IniFile.load('mytest.ini')
    myini.each_section do |section|
      puts "I want #{myini[section]['somevar']} printed here!"
    end

Contributing
------------

Contributions are gladly welcome! For small modifications (fixing typos,
improving documentation) you can use GitHub's in-browser editing capabilities
to create a pull request. For larger modifications I would recommend forking
the project, creating your patch, and then submitting a pull request.

Mr Bones is used to manage rake tasks and to install dependent files. To setup
your environment ...

    $ gem install bones
    $ rake gem:install_dependencies

And always remember that `rake -T` will show you the list of available tasks.


License
-------

MIT License
Copyright (c) 2006 - 2014

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
