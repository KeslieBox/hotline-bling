# Hotline Bling

This is an application created for Dispatch Hotlines/ call centers to help keep track of call logs and store caller information in a secure database.

## Cloning & Setup

-Clone the repository & run ```git clone <github-repo-code>``` 

-```cd``` into the directory

-run ```bin/rails db:migrate RAILS_ENV=development```

-run ```bundle install```

-run ```rails s``` in the terminal to start your server

-Finally go to <http://localhost:3000/> in your browser 

Enjoy your dispatch!

## Google Authentication

**Note: In order to use google authentication, you will need to utlitize your own Google Client Key and Secret. 

-If you decide to use this third party login, create a file called ```.env``` and paste ```GOOGLE_CLIENT_ID=``` followed by your client id and ```GOOGLE_CLIENT_SECRET=``` followed by your Google secret.

-Otherwise, to create an account, click the link to "signup" and create an account name and password. From here, you can use the navigation bar to add a new call, view your calls, view all calls, edit calls, etc.
