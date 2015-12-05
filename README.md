**Local Lingust Server**

This is a back-end server application for the Local Linguist Android application.

Local Linguist is a mobile application for capturing linguistic data from remote locations where there is insufficient funding to research and document the local languages and dialects that exist. This has been developed on the Android platform to make it as widely available as possible.

Linguist is a web application designed to fulfil two primary goals:

* Consolidate the information uploaded from Local Linguist into a database that can be searched by linguists.

* Provide the facility for Linguists to define studies to be sent to the Local Linguist application for research.


Linguist has been developed using Ruby on Rails. To run this application, you will need the following installed:

* Ruby version 2.2.2 (2.2 or later is fine)
* Rails version 4.2.3
* Postgresql

*To install and run Local Linguist*:

    git clone https://github.com/RHoKAustralia/local-linguist-server
    gem install bundler
    cd local-linguist-server
    bundle install

*Database Installation and Configuration*:

    rake db:create
    rake db:migrate
    rake db:seed
    rake db:test:prepare

*Runing tests*:

    rake

*Running the server*

    rails s

The server will then be running.

*data relationships*

The Linguist application has the following data relationships.

* More detail here...

*Local Linguist Client*

The client component and instructions for setting it up are avaliable here:

[https://github.com/RHoKAustralia/melb-timor-leste](https://github.com/RHoKAustralia/melb-timor-leste)
