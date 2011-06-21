require 'active_support'
require 'ar2json/to_json'
require 'ar2json/railtie' if defined?(Rails) and Rails::VERSION::MAJOR > 3

module Ar2json
  # The version of ar2json you are using.
  VERSION = '1.0.0'
end
