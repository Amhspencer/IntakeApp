# IntakeApp
Intake App for BCEF

  Breast Cancer Emergency Fund needs an app that allows them to quickly receive and process their intake forms.  Currently, BCEF qualified partners such as nurses, social workers, and BCEF volunteers in the field fill out paper intake forms with potential clients.  These forms are the first step in a more exhaustive application process conducted by BCEF.  In the current situation these forms often take weeks to get to the BCEF office before they are processes within 24 hours.  Reducing this sometimes weeks delay is crucial for allowing BCEF to assist clients in emergency situations.
	The app we plan to build will allow partners meeting with clients to fill out an electronic form that is immediately accessible to BCEF admins.  This will significantly improve BCEFs operations by reducing the delay in receiving intake forms.  The app will need to be secure and HIPAA compliant because of the nature of the information being transmitted.  The forms will also need to include an electronic signature.

Note: Partners, Clients, and BCEF admins are the three stakeholders that will have some form of direct or indirect interaction with this app.

=== Deploy to heroku ===
- If "push heroku master" is rejected, make a new folder and clone everything from local app to that new folder.
- Heroku DB error: should run "heroku run rake db:migrate" and "herku run rake db:seed" again

=== Info ===
Introduction interview video with BCEF:
http://youtu.be/C0hG3FG5_zg

Pivotal Link:
https://www.pivotaltracker.com/n/projects/1282432

Code Climate:
https://codeclimate.com/github/Berkeley-BCEF/IntakeApp

Heroku: 
http://bcef.herokuapp.com/

Collaboration Folder:
https://drive.google.com/drive/u/1/#folders/0B8Lf25J0nO4ibXpNNVdQMDJXVW8
