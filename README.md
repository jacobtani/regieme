### Regieme
`Regieme` is our wedding website. It allows guests to view information about the wedding as well as RSVP and record gift contributions.

### Setup

* Install all required gems: ```bundle install```

* Update the database configuration file 'database.yml'.

* Create database: ```rake db:create```

* Run all migrations: ```rake db:migrate```

* Seed the database: ```rake db:seed```

* Import the guest list in csv format using the following command to heroku (sample csv file contained):
```
 psql `heroku config:get DATABASE_URL -a iwandtj`?ssl=true -c "\copy guests FROM '/home/tania/all-guests.csv' WITH CSV;"
 ```

* Run application server: ```rails s```

### Database

Regieme uses a PostgreSQL database to build the application. Ensure you have it running on your machine (please refer to: http://www.gotealeaf.com/blog/how-to-install-postgresql-on-a-mac)

### Author

* Tania Jacob (https://github.com/jacobtani)
