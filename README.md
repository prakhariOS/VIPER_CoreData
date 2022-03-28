
# VIPER
VIPER is an application of Clean Architecture to iOS apps. The word VIPER is an acronym for View, Interactor, Presenter, Entity, and Routing. This architecture is based on the Single Responsibility Principle which leads to a clear architecture.
 
View:- The responsibility of the view is to send the user actions to the presenter and show whatever the presenter tells it.
Interactor:- This is the backbone of an application as it contains the business logic.
Presenter:- Its responsibility is to get the data from the Interactor on user actions and after getting data from the Interactor, it sends it to the view to show it. It also asks the router for the navigation.
Entity:- It contains basic model objects used by the Interactor.
Router:- It has all navigation logic for describing which screens are to be shown when. It is normally written as a wireframe.


# CoreData
It's an object graph and persistence framework provided by the apple, it allows data organized by the relational entity-attribute model to be serialized into SQLite stores. And it’s save your application’s permanent data offline.

# Project Overview
In this project we used VIPER Architecture to show the product list, project detail page and company list. We used a Swinject third party which follows the dependency injection concept, as we register the view controllers and assemble(To build a container via instances) it through the constructor.
We used Core data to store data locally in the form of a table where I created the company entity and their attributes to show the company listing on the view, through core data we can create, save, fetch, delete the company data. To achieve this functionality we used a Repository pattern that provides an abstraction of data. Using this pattern can help achieve loose coupling and allow us to inject as a dependency.
