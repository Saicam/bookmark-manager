def setup_test_database
  connection = PG.connect(dbname: 'bookmark_manager_test')

  # Clear the bookmarks table
  connection.exec("TRUNCATE bookmarks;")

  # Add the rewuired bookmarks to the tests
  connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com', 'Makers Academy');")
  connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com', 'Destroy all Software');")
  connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com', 'Google');")
end
