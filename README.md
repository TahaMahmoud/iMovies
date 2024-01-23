# iMovies

## <a name="intro"></a> Intro
iMovies is an iOS application designed to demonstrate clean architecture principles practically. This app showcases various functionalities, and this documentation provides a detailed insight into its technical intricacies and design choices.


# Table of contents
- [Intro](#intro)
- [Quick Start](#quick-start)
    - [Prerequisites](#quick-start-prerequisites)
- [App Features](#features)
- [Used In the App](#used-in-app)
- [Design System](#design-system)
    - [Idea](#design-system-idea)
    - [Core](#design-system-core)
    - [Components](#design-system-components)
- [Core Layers](#core-layers)
    - [Core](#core-layers-core)
    - [Networking](#core-layers-network)
    - [Logger](#core-layers-logger)
    - [DataPersistence](#core-layers-data)
- [App Architecture](#app-architecture)
- [Unit Testing](#unit-testing)
- [Screenshots](#screenshots)
- [TODO](#todo)
- [Author](#author)

# <a name="quick-start"></a> Quick Start
This Quick Start guide will get you up with the app
## <a name="quick-start-prerequisites"></a> Prerequisites
- Xcode 15.1
- iOS 16.0

# <a name="features"></a> App Features
- Home [Highlight movies]
- Category Movies 
    - Popular
    - Now Playing
    - Upcoming
    - Top Rated
- Pagination
- Search
- Movie Details
- Wishlist
- Add To Wishlist
- Remove From Wishlist
- Share Movie
- Tab Bar

# <a name="used-in-app"></a> Used In the App
- SwiftUI
- Combine
- DIContainer: Dependency Injection
- Coordinator, Repository, Builder, Factory, Singleton patterns ...etc
- Stinsen: Routing Package
- SwiftLint
- Fastlane
    - Run SwiftLint
    - Run Unit Tests
        - Run Domain Unit Tests
        - Run Data Unit Tests

# <a name="design-system"></a> Design System
## <a name="design-system-idea"></a> The Idea
The reusability of the design is one of the most important concerns while we are building a scalable application that not only serves just a single application but also can serve multiple applications inside the organization, So, I created a Swift Package named "Design System", This package contains the common UI handling that can be shared with more than one app for more reusability.

The idea behind the built design system is to have a file for each application that contains the design system values per this application/theme, 
So, We have a base struct for the design system, Each application/theme will have its values.

Initially, We have only the colors inside the design system, But we should handle all the variable tokens such as Typography, Padding, Sizing, Colors, ...etc

## <a name="design-system-core"></a> Core
The design system has a class for configuring the app theme,
So, Each app can do something like this:
```
import DesignSystem

DesignSystem.shared.setupTheme(theme: .iMoves)
```

This package contains Extensions, iMoviesDesignSystem, Resources[Fonts/Assets], and Components.

## <a name="design-system-components"></a> Components
After the design analysis, I divided the design system components into two parts: 

- Basic Components: [Buttons, TabBar, SearchInput ...etc]
- Product Components: The reusable views inside the app to be used in more than one screen [DescriptionMovieItemView, ShortMovieItemView, RatingView, EmptyState ...etc]

# <a name="core-layers"></a> Core layers
I also built a Swift package for the core layers, This package consists of libraries for the core layers inside the app, Such as: 

## <a name="core-layers-core"></a> Core 
[Extensions, Utilities, Mappers, Typealias]
## <a name="core-layers-network"></a> Networking 
URLSession-based Network layer, Remote Response Handler, Local Response Handler, Error Handler, ...etc
## <a name="core-layers-logger"></a> Logger
Initially, We had only the system logger engine that debug print the log messages, But it's open for extension and adding new engines
## <a name="core-layers-data"></a> Data Persistence
This layer is built to persist many types of data with **save, update, and remove** options, Initially it is built with only the **UserDefaults** to achieve the PoC, I know that this use case can't be persisted inside the UserDefaults, But for the seek of time I depended on the **DataManagerProtocol** to handle it later, And later I'll add the **CoreData, Realm, and SwiftData** managers.

# <a name="app-architecture"></a> App Architecture
This app is built using the  [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) guidelines and I separated the **Domain** and **Data** in separate Swift Packages to be reused inside the application, Giving us the required scalability level away from the presentation layer,
And, the **Presentation** layer is on the app side and separated by **module/feature/screen**

## Domain layer
The Domain layer consists of the **UseCases, RepoProtocols, And the Entities**
It also has the actual **UseCase Implementation**.

## Data layer
The Data layer consists of **DataSources, Endpoints, ReposImplementation, DTOs**. 

## Presentation Layer
The Presentation layer is an app-side containing the Modules, Features, and screens.
The presentation layer is built using the **MVVM With Coordinator** presentation architecture.

## How the App. & Layers communicating?
As we are separating the **domain and data** layers from the application and presentation layer, We need to handle the communication between the layers and the application side, We have the CoreData library that enables the application side to setup the data with the configuration and inject the dependencies that the data package need to run, We have the AppConfig and the APIConfig for this mission.

# <a name="unit-testing"></a> Unit Testing
I covered the **UseCases** with success and failure test cases
I'll update this project with the other test cases such as Repos, DataSources, ViewModels, and so on.



# <a name="screenshots"></a> Screenshots
| Launch Screen | Home     | Home WishList     | Home Banner     |
| :-------- | :------- | :-------     | :-------     |
| <img src="/Screenshots/Splash.png" width="200" height="400">        | <img src="/Screenshots/Home.png" width="200" height="400">       | <img src="/Screenshots/Home_Wishlisted.png" width="200" height="400">       | <img src="/Screenshots/Home_Banner.png" width="200" height="400">       |

| Search (Empty State) | Search     | WishList (Empty State)     | WishList     |
| :-------- | :------- | :-------     | :-------     |
| <img src="/Screenshots/Search_Empty.png" width="200" height="400">        | <img src="/Screenshots/Search.png" width="200" height="400">       | <img src="/Screenshots/Wishlist_Empty.png" width="200" height="400">       | <img src="/Screenshots/Wishlist.png" width="200" height="400">       |

| WishList (Swipe to remove) | Movie Details     | Movie Details (Reviews)     | Movie Details (Cast)     |
| :-------- | :------- | :-------     | :-------     |
| <img src="/Screenshots/Wishlist_Remove.png" width="200" height="400">        | <img src="/Screenshots/MovieDetails.png" width="200" height="400">       | <img src="/Screenshots/MovieDetails_Reviews.png" width="200" height="400">       | <img src="/Screenshots/MovieDetails_Cast.png" width="200" height="400">       |



# <a name="todo"></a> TODO:-
- [ ] Add CoreData, Realm, and SwiftData manager into the DataPersistece library
- [ ] Add Unit Tests for the Repos
- [ ] Add Unit Tests for the data sources
- [ ] Enhance the design system
- [ ] Finalize the File Template to auto-generate the modules
- [ ] Support Dark Mode / Light Mode
- [ ] Add UI Tests
- [ ] Localization
- [ ] Enhance the design system

# <a name="author"></a> Author
Created by 
- Taha Mahmoud [LinkedIn](https://www.linkedin.com/in/engtahamahmoud/)

Please don't hesitate to ask any clarifying questions about the project if you have any.
