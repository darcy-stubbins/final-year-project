# OU TM470 Final Year Project Flutter Frontend Read Me:

Please ensure you read *both* this read.me and the corresponding read.me for the API [here](https://github.com/darcy-stubbins/final-year-project-api-v2), in order to complete the full set up. 

## Features 

* Login/account creation portal
* A bottom navigation bar with four different tabs to navigate around the app, including: 
    * Home page
    * Pattern upload section* 
    * Saved pattern section 
    * Profile section*  
* The home page offers a search bar with full functionality to search over all patterns by their display names
* The ability to save/unsave a pattern by clicking the corresponding button and have that immediately displayed/un-displayed in the save section. 
* The ability to like/dislike a pattern by clicking the corresponding button. 
* On the click of the comments button, be able to view comments left by other users on each pattern 
    * Also being able to leave your own comment and it be immediately displayed in the comments section on that pattern
* Being able to view the PDF associated with the chosen pattern, with full scrolling functionality*
* Having a counter available to record number of rows/stitches etc. that may be needed*

__(* See 'Limitations' section for more information on any current issues)__

## Supported Platforms 

Android and iOS (and web __if not__ consuming the local API)

## Dependencies  

* Android SDK to run the Flutter Emulator, read more and download [here](https://developer.android.com/studio/install?gad_source=1&gclid=Cj0KCQjw28W2BhC7ARIsAPerrcLG96yx9NzG_xwg0tyV3cFF3MwA9PRpBaV84sWI2VznmkeC0HqPjpgaAuziEALw_wcB&gclsrc=aw.ds).
* Docker to run the containers for the API (only required if consuming the API through this app), read more and download [here](https://www.docker.com/products/docker-desktop/). 

## Installation 

__To run the flutter app through terminal:__

```
flutter run lib/main.dart
```

## Limitations and known issues 

* There is currently no PDF upload support for the pattern upload section and is currently out-of-use, there is however viewing capabilities shown with an example PDF
* There is currently no support for uploading a profile picture in the Profile section and is out-of-use,however again, there are viewing capabilities and device file access is available. 
* Currently the counters within each pattern will not persist any stored count data but are functional within an instance

