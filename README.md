# Coronavirus_stats_API

## Table of contents
* [General info](#general-info)
* [Technologies](#technologies)
* [Setup](#setup)

## General info
Working with APIs using Cocoapods. 
	
## Technologies
Project is created with:
* Built using XCode 13.4.1 
* Swift 5
	
## Setup
How to run the example? 
* Clone this repo 
* Open your favorite terminal
* Go to the folder project from your terminal with command "cd your/folder/proect/directory".
* Now you have to create the famously "Podfile":
```
touch Podfile
```
* After that command, if you list the content directory you'll can see file with name Podfile. Now it's time to run the next command.
```
pod install 
```
###Output
```
Last login: Mon Aug  1 13:51:56 on ttys000
user@Islomjons-MacBook-Pro ~ % cd /Users/user/Desktop/iOS\ Lessons/CoronavirusAPI
user@Islomjons-MacBook-Pro CoronavirusAPI % pod install
Analyzing dependencies
Downloading dependencies
Installing Alamofire (5.6.2)
Installing SDWebImage (5.13.1)
Installing SnapKit (5.6.0)
Installing SwiftyJSON (5.0.1)
Installing lottie-ios (3.4.0)
Generating Pods project
Integrating client project

[!] Please close any current Xcode sessions and use `CoronavirusAPI.xcworkspace` for this project from now on.
Pod installation complete! There are 5 dependencies from the Podfile and 5 total pods installed.

[!] Automatically assigning platform `iOS` with version `13.0` on target `CoronavirusAPI` because no platform was specified. Please specify a platform for this target in your Podfile. See `https://guides.cocoapods.org/syntax/podfile.html#platform`.
user@Islomjons-MacBook-Pro CoronavirusAPI % 

```
* The last command is in charge of create project the dependencies and new Workspace to work on Xcode.
```
Coronavirus_stats_API
```
* Now you can open the new Workspace from the terminal with the next command, or open the from Finder app.
```
open Coronavirus_stats_API.xcworkspace
```
