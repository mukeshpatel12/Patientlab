# PatientLab App

Things you may want to cover:

* Ruby version
    ruby 2.6.6

* Rails version
    Rails 6.0.4


Build the containers -
    `docker-compose build`

* Create Database
    `docker-compose run web bundle exec rails db:create`
    `docker-compose run web bundle exec rails db:migrate`

* To run rails server
    `docker-compose up --build`
    `run on browser: localhost:3000` 

* To run test cases
    `bundle exec rails test`

# Service

* LaboratoryApiService
    This service used to read the json file and send response to controller again with condition.

* CreatePatientLabService
    This service take the json data and create the Patient record and it's association record i.e Patientlab model.
