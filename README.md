# README

Requirements for exercise were taken from https://github.com/ridecharge/rps

INSTRUCTIONS
- git clone this repo
- please run bundle install to install any missing gems
- checkout the feature branch: `git checkout feature`
- make sure you have npm and yarn installed locally, if not, this project won't run
- create routes: rails routes
- create db - rake db: create
- start a server: rails s
- open https://localhost:3000

DESIGN DECISIONS
- first off, it is immediately apparent that we don't need to preserve state anywhere in this app for it to function as required. However, since we are treating this as a flexible app and taking future concerns into consideration, I tried to design this so it could be easily modified to do so at a later date.

- styling is terribly done, but functional to the specs. just wanted to "make it so" in least amount of time

- I had considered moving game rules and general logic to a module. I think there is merit to doing so, but classes are fine 

- considered making separate subclass for Computer, but since Player really only does one thing (player only makes a move, as such it should also know if a given move is valid) right now I didn't

- overall given the requirements the solution that makes the most sense by far is pure JS. We don't need to preserve state, we don't need to hide sensitive information, and we don't entirely care about validating inputs or the user manipulating them, so a back-end isn't really necessary. However since I'm a back end dev, I used RoR

- Decided to forgo most testing to meet 2-3 hr time limit

TODOS/IMPROVEMENTS
  - travis CI
  - unfinished tests (model, controller, integration tests)
  - move display methods from game to helper methods
  - move API call off of player into separate module
  - improve overlay

* ...
