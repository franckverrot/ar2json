require '../../ar2json'

module Ar2json
  class Railtie < Rails::Railtie
    initializer "ar2json.configure_rails_initialization" do
      ActiveRecord::Relation.extend(Ar2json)
    end
  end
end
