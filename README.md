# ar2json

* https://github.com/cesario/ar2json

## DESCRIPTION:

ar2json provides a `to_json` method on an ActiveRecord::Relation object.
This method will return a JSON representation, in a String object, of
the resultset.

Why is this useful? Because the JSON is mostly outputed by your database engine.

## TODO

* `User.scoped.to_json` and `User.all.to_json` should return the same data structure
* Pivot the resultset in the DB to have a single value returned by the
  DB (it's now done in to\_json.rb)

## FEATURES/PROBLEMS:

* Tested with SQLite and PostgreSQL

## SYNOPSIS:

### Rails 3 Configuration

In the project's Gemfile add

    gem 'ar2json'

### Usage

Say Product is your model:

    class Product < ActiveRecord::Base
    end

Use `to_json` like this

    Product.where(:color => 'blue').to_json

If your database looks like this

                +---------------------------------+
                |ID  Name                Color    |
                |---------------------------------|
                | 1  Foo                 blue     |
                | 2  Bar                 red      |
                | 3  Baz                 blue     |
                +---------------------------------+

`Product.where(:color => 'blue').to_json` will return

    [
      { "id": "1", "name": "Foo" },
      { "id": "2", "name": "Baz" }
    ]


## Some benchmark now

### Lab

    ➜  uname -a
    [...] Darwin 10.7.0 Darwin Kernel Version 10.7.0 [...]

### SQLite3

                                          user     system      total        real
    User.scoped.to_json                   0.230000   0.010000   0.240000 (  0.246796)
    User.all.to_json                      2.320000   0.080000   2.400000 (  2.430381)
    User.where(:id => [1,2]).to_json      0.180000   0.010000   0.190000 (  0.182994)
    User.where(:id => [1,2]).all.to_json  0.300000   0.020000   0.320000 (  0.322805)
    User.where(:id => 1).to_json          0.160000   0.010000   0.170000 (  0.196703)
    User.where(:id => 1).all.to_json      0.220000   0.010000   0.230000 (  0.230023)

### PostgreSQL

                                          user     system      total        real
    User.scoped.to_json                   0.080000   0.010000   0.090000 (  0.223884)
    User.all.to_json                      2.200000   0.090000   2.290000 (  2.393640)
    User.where(:id => [1,2]).to_json      0.140000   0.010000   0.150000 (  0.256728)
    User.where(:id => [1,2]).all.to_json  0.270000   0.020000   0.290000 (  0.368916)
    User.where(:id => 1).to_json          0.140000   0.010000   0.150000 (  0.249957)
    User.where(:id => 1).all.to_json      0.200000   0.010000   0.210000 (  0.277496)


## REQUIREMENTS:

* Rails
* ActiveRecord >= 3.0.0
* A database :D

## INSTALL:

* (sudo) gem install ar2json

## LICENSE:

(The MIT License)

Copyright (c) 2011 Franck "Cesario" Verrot

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
