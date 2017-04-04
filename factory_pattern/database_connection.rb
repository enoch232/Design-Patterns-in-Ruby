class DatabaseConnectionFactory
  def initialize(format)
    @database_class = self.class.const_get("#{format}DB")
  end

  def connect
    puts "You have successfully connected to the #{@database_class}"
    @database_class.new
  end
end


class MysqlDB
end

class PostgresqlDB
end

class SqliteDB
end

db1 = DatabaseConnectionFactory.new(:Mysql)
db1.connect

db2 = DatabaseConnectionFactory.new(:Postgresql)
db2.connect

db3 = DatabaseConnectionFactory.new(:Sqlite)
db3.connect
