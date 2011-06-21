module Ar2json
  def to_json(columns = nil)
    columns = columns.nil? ? self.columns_hash.keys : columns
    columns = [columns] if columns.is_a?(Symbol)
    projections = '\'{'
    projections << columns.map do |col|
      "\"#{col.to_s}\":' || '\"' || #{col.to_s} || '\"'"
    end.join('|| \',')
    projections << '|| \'}\' as json'
    sql = self.select(projections).to_sql

    #TODO: We should pivot the resultset directly in the database to
    #leverage the database engine even more.
    "[#{ActiveRecord::Base.connection.execute(sql).map { |rec| rec['json'] }.join(',')}]"
  end
end
