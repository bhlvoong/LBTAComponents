# LBTAComponents

[![CI Status](http://img.shields.io/travis/Brian Voong/LBTAComponents.svg?style=flat)](https://travis-ci.org/Brian Voong/LBTAComponents)
[![Version](https://img.shields.io/cocoapods/v/LBTAComponents.svg?style=flat)](http://cocoapods.org/pods/LBTAComponents)
[![License](https://img.shields.io/cocoapods/l/LBTAComponents.svg?style=flat)](http://cocoapods.org/pods/LBTAComponents)
[![Platform](https://img.shields.io/cocoapods/p/LBTAComponents.svg?style=flat)](http://cocoapods.org/pods/LBTAComponents)

![LBTABanner](http://i.imgur.com/tTQOLtp.png)

## Description
LBTAComponents is a very simple library of components I use to build out production applications.  The ultimate goal of open sourcing this chunk of code is to speed up the teaching and recording process for all the tutorials on my YouTube channel [LetsBuildThatApp](https://www.youtube.com/letsbuildthatapp).

## Why would you use this?
This project is continuously evolving, but as of right now the important components are:

1. **DatasourceController** - Think of this as UICollectionViewController on steroids.  No longer do we have to register cells with their own ids.  Providing a simple subclass of Datasource will render out the list items.
2. **CachedImageView** - Loading images and caching them is quite tedious, this is my basic implementation that I'm providing. For more on image caching, watch my [tutorial](https://youtu.be/XFvs6eraBXM).
3. **UIView anchors extension** - Let's face it, the amount of code required to place views onto the screen isn't great.  With this extension, you can anchor any view to any other view with just one line of code, albeit you need a few minutes to learn it.

## Basic Example
Here's how easy it is to render a list

```swift
import LBTAComponents

class BasicController: DatasourceController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let words = Datasource()
        words.objects = ["Hello", "How", "are", "you", "today", "?"]
        self.datasource = words
    }
    
}
```

![BasicController](http://imgur.com/TxF1E8B.png)

OK, so that's not a very interesting list you say. Providing some additional cell classes, you can easily modify your list to look like:

![BasicHeaderCellFooterController](http://imgur.com/N52MQuw.png)

## How to Run the Examples

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
This project requires Xcode 7+ running a target of iOS 9.1+ along with Cocoapods.

## Installation

LBTAComponents is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "LBTAComponents"
```

## Author

Brian Voong, letsbuildthatapp@gmail.com

## License

LBTAComponents is available under the MIT license. See the LICENSE file for more info.