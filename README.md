# toy_robot
My implementation of the Toy Robot exercise completed in Ruby.

**Getting it up and running**

After downloading a local copy of the project, navigate to the root directory of the project and first install dependencies:

`bundle install`

Then you can run the project with:

`ruby lib/main.rb`

**Testing**

To run the test suite of this project simply run:

`bundle exec rspec`

**TO-DO**

Currently the test coverage is not at 100% due to one of the interactions being better suited to integration testing. Either an 
integration test is needed to reach 100% coverage or the method in question needs to be made more modular to better accomodate testing
