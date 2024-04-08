# iMarvel

## Installation
- Clone the repository and resolve the package in case of build errors
- Create a new property list file called `Config.plist` and paste the following:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>apiKey</key>
    <string>API_KEY</string>
    <key>privateKey</key>
    <string>PRIVATE_KEY</string>
</dict>
</plist>
```
> fetch apiKey and private key from the marvel API docs

## About
Simple app that consumes the marvel api and caches the data locally using CoreData. 

## Used Dependencies
- [Alamofire](https://github.com/Alamofire/Alamofire)
- [RxSwift](https://github.com/ReactiveX/RxSwift)
- [SDWebImage](https://github.com/SDWebImage/SDWebImage)
- [SnackBar](https://github.com/ahmedAlmasri/SnackBar.swift)

## Extra Added features
- Infinite Scrolling
- Name Searching using SearchBar
- Dummy Login screen (local, No API Call)
- Works in dark and light mode
