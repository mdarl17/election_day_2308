# Election Day

## Preparation

* Fork this Repository
* Clone YOUR fork
* Compete the activity below
* Push your solution to your fork
* Submit a pull request from your repository to the turingschool-examples repository
  * Make sure to put your name in your PR!
  * Please include a reflection on how this challenge went for you.

## Iteration 1

Use TDD to create a `Candidate` class that responds to the following interaction pattern.

```ruby
pry(main)> require './lib/candidate'
=> true

pry(main)> diana = Candidate.new({name: "Diana D", party: :democrat})
=> #<Candidate:0x00007fd83736dbe0...>

pry(main)> diana.name
=> "Diana D"

pry(main)> diana.party
=> :democrat

pry(main)> diana.votes
=> 0

pry(main)> diana.vote_for!

pry(main)> diana.vote_for!

pry(main)> diana.vote_for!

pry(main)> diana.votes
=> 3

pry(main)> diana.vote_for!

pry(main)> diana.votes
=> 4
```

## Iteration 2

Use TDD to create a `Race` class that responds to the following interaction pattern.

The `register_candidate!` method must take a Hash as an argument and return an instance of `Candidate`.

```ruby
pry(main)> require './lib/candidate'
=> true

pry(main)> require './lib/race'
=> true

pry(main)> race = Race.new("Texas Governor")
=> #<Race:0x00007f9edf307688...>

pry(main)> race.office
=> "Texas Governor"

pry(main)> race.candidates
=> []

pry(main)> candidate1 = race.register_candidate!({name: "Diana D", party: :democrat})
=> #<Candidate:0x00007f9edf376c90...>

pry(main)> candidate1.class
=> Candidate

pry(main)> candidate1.name
=> "Diana D"

pry(main)> candidate1.party
=> :democrat

pry(main)> candidate2 = race.register_candidate!({name: "Roberto R", party: :republican})
=> #<Candidate:0x00007f9edf386780...>

pry(main)> race.candidates
=> [#<Candidate:0x00007f9edf376c90...>, #<Candidate:0x00007f9edf386780...>]
```

## Iteration 3

Use TDD to create an `Election` class that satisfies the following requirements.

You have been contacted by the local government to create a program that helps track their elections by organizing registered candidates and their votes.

| Method Name | Return Value |
| ----------- | ------------ |
| #new        | An `Election` object that has an attribute of year (string data type). |
| #year       | The year of the election (string). |
| #races      | An array of `Race` objects. |
| #add_race(race)   | An array of `Race` objects including the newly added `Race` object. |
| #candidates | An array of all `Candidate` objects in the election. |
| #vote_counts | A hash with each candidate's name as a key and their count of votes as the value. |

## Iteration 4
Use TDD to implement the following methods on the `Race` class.

The local government agency has contacted you about compiling additional information about each of the races.

| Method Name | Return Value |
| ----------- | ------------ |
| #open?      | A boolean indicating whether the race is open or not. A race should be open by default. |
| #close!     | Close the race (should no longer be open). |
| #winner     | `false` if the race is still open. It should return the candidate with the most votes if not open. If there is a tie, it should return any candidate with the highest number of votes. |
| #tie?       | A boolean indicating if two or more candidates received the highest number of votes. |

Use TDD to implement the following methods on the `Election` class.

Additionally, the local government would like you to expand the information they have about their elections.

| Method Name | Return Value |
| ----------- | ------------ |
| #winners    | An array of the `Candidate` objects that represents the winner from each race. If the race is a tie or is still open, no winner should be returned for that race. |
