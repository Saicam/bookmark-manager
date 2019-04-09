require 'pg'

class Bookmark

  DATABASE = "bookmark_manager"
  TABLE = "bookmarks"
  
  def self.list(database_class = PG)
    con = database_class.connect( dbname: DATABASE )
    result = con.exec( "SELECT url FROM #{TABLE}" )
      result.map { |bookmark| bookmark["url"] }
  end
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
