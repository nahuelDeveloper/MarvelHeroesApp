# MarvelHeroesApp
Sample app that consumes the Marvel API. Using UIKit and Swift.

## Description
The app consumes the [Marvel API](https://developer.marvel.com/docs#!/public/getComicsCollection_get_6) to display a list of Marvel characters. The user can select a character from the list and go to a details page, where more information from the character is shown.

## App Features
* Networking: The Home Screen displays a list of characters that is loaded from the endpoint /v1/public/characters. If there is and error on the first load, the user can retry as many times as needed without having to repoen the app.
* Pagination: The user can scroll the list and more characters will be loaded every time the bottom of the list is reached.
* Navigation: The user can select a Character and navigate to a detail, where more info from the characters is displayed.

## Architecture
I used Model View Presenter + Coordinator for the app. This mix of patterns allows me to write testable code from the begining, mainly focusing on testing the model entities and the presenters. If enforces a clear separation of concerns, helping to keep views as simple as possible, and encapsulating the business logic in the presenters. The Coordinator pattern suggests to use a coordinator class to handle navigation logic, taking that responsibility away from the view controllers.

# Third party libraries
I'm comfortable writing UI programmatically, and i use [Pure Layout](https://github.com/PureLayout/PureLayout) to manage all the logic related to auto layout. I have been using this library for many years, and if find it simple to use and very powerful.

For image loading, i use [Kingfisher](https://github.com/onevcat/Kingfisher). It has many built in features for image downloading and for caching, and since it adds an extension to UIImageView, it's pretty straightforward to use.

For networking, i choose [Moya](https://github.com/Moya/Moya). I have seen and implemented miself very different ways to handle networking, and i believe that with Moya, there are many advantages. I specially appreciate the use of enums with values for each endpoint, because it helps to keep the code simple and easy to understand and mantain.

Last but not least, i like to use [JGProgressHUD](https://github.com/JonasGessner/JGProgressHUD) to display a simple and highly customizable loader.

## Features i would like to add:
* Search: i think this could be a very useful feature. The same endpoint that loads the characters must be used for this features, so this adds a little bit of complexity to the network layer (it already supports pagination). Maybe it could be better to try it as a separate endpoint.
* Custom transition from home screen to detail screen.
* More information about the character on the detail screen.
* Offline support with Core Data. This will add more complexity to the code, so i believe that an extra layer of abstraction will be needed, a DataProvider. The Presenters will ask the DataProvider for the information that they need, and the DataProvider will decide if it loads it from the network, or loads it from the device storage.
* Grid view for the home. Currently, the characters are displayed on a list. I would like to add a grid view, and let the user choose which view he/she prefers.




