require 'pg'

class Bookmark

  DATABASE = "bookmark_manager"
  TABLE = "bookmarks"
  attr_reader :id, :url, :title

  def initialize(id:, url:, title:)
    @id = id
    @url = url
    @title = title
  end

  def self.add(url:, title:)
    if ENV['RACK_ENV'] == "test"
      database = "bookmark_manager_test"
    else
      database = DATABASE
    end
    con = PG.connect( dbname: database )
    result = con.exec( "INSERT INTO #{TABLE} VALUES(DEFAULT, '#{url}', '#{title}')  RETURNING id, title, url;" )
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end


  def self.list
    if ENV['RACK_ENV'] == "test"
      database = "bookmark_manager_test"
    else
      database = DATABASE
    end
    con = PG.connect( dbname: database )
    result = con.exec( "SELECT id,url,title FROM #{TABLE};" )
      result.map do |bookmark|
        Bookmark.new( id: bookmark['id'], url: bookmark['url'], title: bookmark['title'])

      end
  end

  def self.remove(id:)
    if ENV['RACK_ENV'] == "test"
      database = "bookmark_manager_test"
    else
      database = DATABASE
    end
    con = PG.connect( dbname: database )
    result = con.exec( "DELETE FROM #{TABLE} WHERE id = #{id};" )
    # Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end
  # def add(address, title, database_class = PG)
  #   if ENV['RACK_ENV'] == "test"
  #     database = "bookmark_manager_test"
  #   else
  #     database = DATABASE
  #   end
  #   con = database_class.connect( dbname: database )
  #   result = con.exec( "INSERT INTO #{TABLE} VALUES(DEFAULT, '#{address}', '#{title}');" )
  # end
end

# conn = PG.connect( dbname: DATABASE )
# con.exec( "SELECT url FROM bookmarks" ) do |result|
#   puts "     PID | Url             |"
#   result.each do |row|
#     puts " %7d | %-16s | %s " %
#       row.values_at('id', 'url')
#   end
# end
# con.exec( "SELECT url FROM bookmarks" ) do |result|
# result.each do |row|
#   b += row.values_at('url')
# end
# end
