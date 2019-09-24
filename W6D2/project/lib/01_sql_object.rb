require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @col if @col
    columns = DBConnection.execute2(<<-SQL).first
      SELECT *
      FROM #{self.table_name}
      LIMIT 0
    SQL
    @col = columns.map!(&:to_sym)
  end

  def self.finalize!
    self.columns.each do |column|
      define_method(column) do 
        self.attributes[column]
      end

      define_method("#{column}=") do |value|
        self.attributes[column] = value
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name || self.name.underscore.pluralize
  end

  def self.all
    results = DBConnection.execute(<<-SQL)
      SELECT #{self.table_name}.*
      FROM #{self.table_name}
    SQL
    parse_all(results)
  end

  def self.parse_all(results)
    results.map {|result| self.new(result)}
  end

  def self.find(id)
    self.all.find {|obj| obj.id == id}
    # results = DBConnection.execute(<<-SQL)
    #   SELECT #{table_name}.*
    #   FROM #{table_name}
    #   WHERE #{table_name}.id = ?
    # SQL
    # parse_all(results).first
  end

  def initialize(params = {})
    params.each do |attr_name, value|
      attr_name = attr_name.to_sym
      if self.class.columns.include?(attr_name)
         self.send("#{attr_name}=", value)
      else
        raise "unknown attribute '#{attr_name}'"
      end
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    self.class.columns.map {|attr| self.send(attr)}
  end

  def insert
    
  end

  def update
    # ...
  end

  def save
    id.nil? ? insert : update
  end
end
