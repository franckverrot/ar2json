gem 'minitest'
require 'minitest/benchmark'

require 'active_record'

require "ar2json/to_json"

if ENV['use_pg']
  require 'pg'
  ActiveRecord::Base.establish_connection(:adapter => "postgresql", :database => ENV['use_pg'], :username => 'postgres')
  ActiveRecord::Base.connection.execute("DROP TABLE users");
  ActiveRecord::Base.connection.execute("CREATE TABLE users (id serial, name varchar(20));")
else
  require 'sqlite3'
  system('rm dbfile.sqlite3')
  ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => "dbfile.sqlite3")

  ActiveRecord::Base.connection.execute("CREATE TABLE users (id integer primary key autoincrement, name varchar(20));")
end

class ActiveRecord::Relation
  include Ar2json
end

class User < ActiveRecord::Base
end

(1..25).each do |index|
  User.create(:name => "foo#{index}")
end
