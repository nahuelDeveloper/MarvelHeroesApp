# MarvelHeroesApp
Sample app that consumes the Marvel API. Using UIKit and Swift.

## Description
The app consumes the [Marvel API](https://developer.marvel.com/docs#!/public/getComicsCollection_get_6) to display a list of Marvel characters. The user can select a character from the list and go to a details page, where more information from the character is shown.

## Architecture
I used Model View Presenter + Coordinator for the app. This mix of patterns allows me to write testable code from the begining, mainly focusing on testing the model entities and the presenters. If enforces a clear separation of concerns, helping to keep views as simple as possible, and encapsulating the business logic in the presenters. The Coordinator pattern suggests to use a coordinator class to handle navigation logic, taking that responsibility away from the view controllers.
