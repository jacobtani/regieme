### Regieme
`Regieme` is our wedding website. It contains details for RSVP and wedding register as well as static info.

### Setup 

* Install all required gems: ```bundle install```

* Update the database configuration file 'database.yml'.

* Create database: ```rake db:create```

* Run all migrations: ```rake db:migrate```

* Seed the database: ```rake db:seed```

* Update the cron jobs: ```whenever --update-crontab```

* Run application server: ```rails s```

### Database

Regieme uses a PostgreSQL database to build the application. Ensure you have it running on your machine (please refer to: http://www.gotealeaf.com/blog/how-to-install-postgresql-on-a-mac)

### Author

* Tania Jacob (https://github.com/jacobtani)
