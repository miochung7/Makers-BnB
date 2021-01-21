require 'pg'
require_relative 'database_connection'
require_relative 'database_connection_setup'

class Space

  def self.all
    DatabaseConnection.query("SELECT * FROM spaces;")
  end
=begin
    result.map do |space|
      Space.new(id: space['space_id'],
            name: space['name'],
            description: space['description'],
            price_per_night: space['price_per_night'],
            available_from: space['available_from'],
            available_to: space['available_to'])
=end

  def self.create_space(name:, description:, price_per_night:, available_from:, available_to:)
    result = DatabaseConnection.query("INSERT INTO spaces (name, description, price_per_night, available_from, available_to) VALUES('#{name}','#{description}','#{price_per_night}','#{available_from}','#{available_to}') RETURNING space_id, name, description, price_per_night, available_from, available_to;")
    Space.new(id: result[0]['space_id'],
      name: result[0]['name'],
      description: result[0]['description'],
      price_per_night: result[0]['price_per_night'],
      available_from: result[0]['available_from'],
      available_to: result[0]['available_to'])
  end

  attr_reader :id, :name, :description, :price_per_night, :available_from, :available_to

  def initialize(id:, name:, description:, price_per_night:, available_from:, available_to:)
    @id = id
    @name = name
    @description = description
    @price_per_night = price_per_night
    @available_from = available_from
    @available_to = available_to
  end
end
