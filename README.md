# RickAndMortyApp

## Description

The application consists of showing a list of Rick and Morty characters and being able to navigate to a detail where you can see more information on the location of each of them.

## Used technologies

For the construction of this solution the following stack has been used:

- XCode 14
- Swift 5
- SwiftUI
- Async/Await
- XCTests

## Architecture

As architecture, MVVM has been used for the presentation layer, composed of a view in SwiftUI communicated with a ViewModel which manages the behavior of the view and it uses datas from use cases (domain layer).
In addition to the presentation layer, we have the domain layer, where we define the use cases that we need, which is fed by the Data layer where we define the necessary repositories.
In the use cases we are defining what we need in our business where we can adapt the datas to our application.
All layers and communicate by protocols to be testable and disengaged and the architecture complies with the solid principles.


## Notes

- The list has an infinite scroll
- In detail we can save a character as a favorite, and we can see the list from the main screen
- We have unit tests for Repositories and Use Cases.

## TODO

- Some repositories and ViewModels do not have tests yet.
- The interface can be improved.
