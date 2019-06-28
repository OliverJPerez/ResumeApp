# ResumeApp

This is a simple application to show the Oliver Perez's knowledge, skills and experience as an iOS developer.

<p align="center">
    <a href="#appearance">Appearance</a> &bull;
    <a href="#Summary">Summary</a> &bull;
    <a href="#Instructions">Instructions</a> &bull;
    <a href="#Instructions">Tests And Coverage</a> &bull;
    <a href="#License">License</a>
</p>


## Summary

This application implements a MVVM + Flow Coordinator architecture in order to follow the single 
responsability principle and improve testability. This app was developed using a TDD approach.
The networking layer is desinged using a protocol oriented aproch.

## Instructions

The targets of the project are written in Swift 4.2, so Xcode 10.1 or higher is needed.

This app was build upon the MVVM + Flow Coordinator architectural pattern, using a decorator pattern with the ‘Observable‘ class to 
to make the binding between view models and view controllers easier. The networking layer is designed using a protocol oriented 
approach in order to create pseudo interactor structs to handle requests, and also to be more swifty. The flow coordinator acts as
a router to coordinate all the navigation of the app. The Storyboarded protocol it's extremely useful to instantiate view controllers 
both in the coordinator and the unit tests. 

## Appearance

![ResumeGif](https://user-images.githubusercontent.com/50214270/59885743-f3b06a00-9381-11e9-879c-e05e4fbac40c.gif)
<img src="https://user-images.githubusercontent.com/50214270/59885744-f3b06a00-9381-11e9-9fb4-0b822581f7f9.png" width="256">
<img src="https://user-images.githubusercontent.com/50214270/59885746-f3b06a00-9381-11e9-891c-cf8f30233c92.png" width="256">
<img src="https://user-images.githubusercontent.com/50214270/59885747-f4490080-9381-11e9-8a66-4b606c9fad2c.png" width="256">
<img src="https://user-images.githubusercontent.com/50214270/59885749-f4490080-9381-11e9-9738-d4388375fc58.png" width="256">
<img src="https://user-images.githubusercontent.com/50214270/59885751-f4490080-9381-11e9-830a-c4995160201f.png" width="256">
<img src="https://user-images.githubusercontent.com/50214270/59885752-f4490080-9381-11e9-848f-e2a7dd522c26.png" width="256">
<img src="https://user-images.githubusercontent.com/50214270/59885753-f4e19700-9381-11e9-80f2-4a19d425d64c.png" width="256">
<img src="https://user-images.githubusercontent.com/50214270/59885755-f4e19700-9381-11e9-9437-76de8fd1ad90.png" width="256">


## Tests And Coverage
The service layer was mocked and stubed inyecting URLSesssionProtocol mocks, 
in order to test the service layer behaviour from json dummy files, so all the tests respects the FIRST testing principle.
The app also contains some integrations tests for the interaction between the view controllers, view models and the flow coordinator.

![Screen Shot 2019-06-20 at 6 08 37 PM](https://user-images.githubusercontent.com/50214270/59886868-7c310980-9386-11e9-9f92-a3ca9f9e465f.png)
