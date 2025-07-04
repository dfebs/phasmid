# Phasmid
A Ruby on Rails web app for tracking bugs

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
- [ ] Show bugs added in real time
- [ ] Add tests
- [ ] Add tags for bugs


## Testing Considerations
- [ ] Simple scenario of adding projects
- [ ] Simple scenario of adding bugs to projects
- [ ] Error scenario in creating a project. Specifically hitting the `rescue ActiveRecord::RecordInvalid` block
- [ ] Might have to remove some stuff from the Project tests (like stuff in fixtures) since they don't have dedicated "owner" fields anymore