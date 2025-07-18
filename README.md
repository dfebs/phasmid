# Phasmid
A Ruby on Rails web app for tracking bugs.

## Requirements
Ruby Version: 3.2 or newer

## How to set up and run
1. `git clone https://github.com/dfebs/phasmid.git`
1. `cd phasmid`
1. `bundle install`
1. `bin/rails db:setup`
1. `bin/rails server`

## For those who are curious about the 2-week version
This was done as part of the [1212 learning process](https://dfebs.com/2025/05/25/1212/). If you would like to see the version of this repository that was done in the 2 week time period, see the [legacy](https://github.com/dfebs/phasmid/tree/legacy) branch. 

## Todo
- [x] Add projects
- [x] Add memberships
- [x] Add bugs (heh)
- [x] Show instant feedback when adding a bug
- [x] Show bugs from other users added in real time
- [x] See if getting page_content at the top level will work
- [x] Ability to edit bugs
- [x] Make bug form appear and reappear at press of a button
- [x] Ability to add project level tags
- [x] Figure out how bug priority feature will work. This will be based on a bug score.
- [x] Add ability to edit project level tags
- [x] Add tags for bugs
- [x] Add "My Bugs" section in left sidebar
- [x] Add ability for bugs to be complete
- [x] Figure out how to do an inline thing for "author" and "created" section in bugs.
- [x] Create a simple navbar from scratch (technically done but not well)
- [x] Add css animations
- [x] Have middle content expand across page if screen is small enough
- [ ] Have a "latest" section and a "priority" section. Can be separated using buttons and a turbo frame. "Latest" section will have the tuned-in stream. Maybe a completed section?
- [ ] Actually use memberships
- [ ] Create consistent flash messages with stimulus (reference: https://www.hotrails.dev/turbo-rails/flash-messages-hotwire)\
- [ ] Maybe use ahoy
- [ ] Actually use bug notes

## Bugs
- [x] Fix issue where tags are appended on editing a bug instead of being modified
- [x] Fix issue where "destroy this project" doesn't work
- [x] Fix issue where the real time bug additions will be applied to all projects. Might be able to target the broadcast based on the project + bug name


## Testing Considerations
- [ ] Simple scenario of adding projects
- [ ] Simple scenario of adding bugs to projects
- [ ] Error scenario in creating a project. Specifically hitting the `rescue ActiveRecord::RecordInvalid` block
- [ ] Might have to remove some stuff from the Project tests (like stuff in fixtures) since they don't have dedicated "owner" fields anymore