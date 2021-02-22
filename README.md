# Yogaeasy Challenge

### Project Structure

* Classes Root:
    * Configuration file - contains predefined global constants e.g. API endpoint and version
    * ApplicationAssembler file - responsible for registering all application assembly files
* Presentation
    * ViewControllerFactory - a global factory for creating view controller instances e.g. MVVM modules
    * Modules - collection of MVVM modules
* Services - contains user case classes
* Models - data models
* Networking - contains all classes related to Yogaeasy API
* Core - architecture core-related classes such as MVVM, Networking, also might be used for iOS core framework wrappers.
* Common - helpers, utils, and extensions classes

### Dependencies Manager

Cocoapods is the dependencies manager in this project. No need to run `pod install`, the Pods directory is included in the project repo to give faster access to the project sources.

### Achitecture Decision

The MVVM+Router architecture has been chosen for this project. MVVM modules are located in the directory **Classe - > Presentation -> Modules**. Each module consists of the following classes: ModuleAssembly, ViewController, ViewModel, Router.

MVVM Highlights
* **ModuleAssembly** - an Assembly class is a part of Swinject DI framework for Swift for [grouping dependencies]("https://github.com/Swinject/Swinject/blob/master/Documentation/Assembler.md") together in one place. Inside of an assemble function, it describes how to connect MVVM module classes between each other, how to inject required dependencies, and registers those classes in a shared DI container.
* **Router** is responsible for screens routing logic and feed them necessary data given by a view model class. It has a weak reference to a view controller in order to use UIKit features for presenting view controllers.

There are no singletons in the project, instead classes that should have a single instance are registered with the "container" scope parameter in assembly files. As the DI container is shared within the app and has global access for assemblies it retains a single reference in it. For example *Classes -> Services -> ServicesAssembly, Line 14*.


### Ways for Improvements

* Add an intermediate repository layer between Services and Networking in order to encapsulate the data caching mechanism
* Add a model to the Presenter layer which will take a responsibility to have a mapped data from a Model that is required for presenting on a screen. The concept of its use is not to use shared Model objects across multiple layers, but to have independent models for Presentation and Repository
* Add a data persistency manager that would give more flexibility to data management e.g. persisting data in memory or a disc, configuration of persistent data lifetime
* Add an application appearance class that will describe UI appearance customization in one place e.g. UINavigationBar.appearance()
