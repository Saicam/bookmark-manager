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
    con = PG.connect(dbname: database)
    result = con.exec("INSERT INTO #{TABLE}
                      VALUES(DEFAULT, '#{url}', '#{title}')
                      RETURNING id, title, url;")
    Bookmark.new(id: result[0]['id'],
                title: result[0]['title'],
                url: result[0]['url'])
  end

  def self.list
    if ENV['RACK_ENV'] == "test"
      database = "bookmark_manager_test"
    else
      database = DATABASE
    end
    con = PG.connect(dbname: database)
    result = con.exec("SELECT id,url,title FROM #{TABLE};")
    result.map do |bookmark|
      Bookmark.new(id: bookmark['id'],
                    url: bookmark['url'],
                    title: bookmark['title'])
    end
  end

  def self.remove(id:)
    if ENV['RACK_ENV'] == "test"
      database = "bookmark_manager_test"
    else
      database = DATABASE
    end
    con = PG.connect(dbname: database)
    con.exec("DELETE FROM #{TABLE} WHERE id = #{id};")
  end
end
