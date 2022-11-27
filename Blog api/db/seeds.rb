# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Article.create([
                 {
                   title: 'First article',
                   body: 'Some text for article'
                 },
                 {
                   title: 'Second one',
                   body: 'Some more text for article'
                 },
                 {
                   title: 'One more article',
                   body: 'Again, another text for article'
                 },
                 {
                   title: 'Fourths article',
                   body: 'Well, this is also text for article'
                 }
               ])

Author.create([
                {
                  name: 'John',
                },
                {
                  name: 'Mary',
                },
                {
                  name: 'Peter',
                }
              ])

Comment.create([
                 {
                   body: 'First comment by John',
                   author_id: 1
                   article_id: 1
                 },
                 {
                   body: 'Second comment by John',
                   author_id: 1
                   article_id: 1
                 },
                 {
                   body: 'First comment by Mary',
                   author_id: 2
                   article_id: 1
                 },
                 {
                   body: 'Fourth comment by Peter',
                   author_id: 3
                   article_id: 1
                 },
                 {
                   body: 'Second comment by Mary',
                   author_id: 2
                   article_id: 1
                 }
              ])

