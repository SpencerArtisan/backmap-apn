# backmap-apn
Notification server for Breadcrumbs

# Testing notifications
Edit test2.rb to put in your device token.  You can find this is the Breadcrumbs firebase 

	https://console.firebase.google.com/u/0/project/firebase-illbeback/database/illbeback/data

Note that the values in firebase may be stale. You can force an update by running Breadcrumbs.

Next run 

	ruby test2.rb

You should see a 6 next to the Breadcrumbs app icon and a hello world message

# Testing share notifications
Once you have confirmed the notifications mechanism is working and the device token is correct (see above), the next step is to check that notifications are
correctly sent when shares are received.

Share a flag with your user, then run

	ruby sharer.rb

This should put a '1' notificaiton on the Breadcrumbs app icon.

# Deploying
The app runs in heroku. Commit all code changes to git, then

    git remote add heroku https://git.heroku.com/backmap-apn.git
	git push heroku master
 
