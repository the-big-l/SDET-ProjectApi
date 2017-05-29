development readme

removed csrf protection
bug with example data
  "expiryDate "
             ^ "extra space at 5:14"

assume 'enabled' to be proper json which is lowercase 'true' or 'false'
Active Record automatically type casts all input so that it matches the database schema. Because of this, truthy values are converted to 'true' and falsy values to 'false'.

Use factory girl and faker for fixtures
