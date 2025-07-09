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

## Todo
- [x] Add projects
- [x] Add memberships
- [x] Add bugs (heh)
- [x] Show instant feedback when adding a bug
- [x] Show bugs from other users added in real time
- [x] See if getting page_content at the top level will work
- [ ] Actually use memberships
- [ ] Figure out how bug priority feature will work
- [ ] Have a "latest" section and a "priority" section. Can be separated using buttons and a turbo frame
- [ ] Add css animations
- [ ] Create consistent flash messages with stimulus (reference: https://www.hotrails.dev/turbo-rails/flash-messages-hotwire)
- [ ] Make bug form appear and reappear at press of a button
- [ ] Add tags for bugs
- [ ] Figure out how to do an inline thing for "author" and "created" section in bugs. How might it integrate with bug notes?
- [ ] Create a simple navbar from scratch, add the phasmid logo
- [ ] Ability to add and edit project level tags
- [ ] Ability to edit comments
- [ ] Fix issue where "destroy this project" doesn't work
- [ ] Maybe use ahoy

## Testing Considerations
- [ ] Simple scenario of adding projects
- [ ] Simple scenario of adding bugs to projects
- [ ] Error scenario in creating a project. Specifically hitting the `rescue ActiveRecord::RecordInvalid` block
- [ ] Might have to remove some stuff from the Project tests (like stuff in fixtures) since they don't have dedicated "owner" fields anymore