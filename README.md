## Sample Projects for GDG Yangon 2023

____

## Server_side_ui Project 🔮

Server side ui project is written using __Mirai__ plugin to demonstrate how to parse Mirai syntax to flutter widgets

### Usage 🏗️

- Just change JSON file name from assets folder in `main.dart` file and restart or re-run the project to see changes



___

## Remote_banner 🔥

Remote banner project uses __Firebase Remote Config__ to control UI from server and to make A/B testings

### Usage 🏗️

- To use this project, you'll have to add __Firebase__ to your project
- Then register your app to __Firebase__ [for me I use __FlutterFire__ for configuration]

- Add firebase remote config conditions in your firebase console and enable firebase remote config api for this project (I know it's a lot of steps)

- For adding remote config conditions, just scam `remote_config_service.dart` file. There are these two code snippets in it: 
```dart
  bool get showMainBanner => _remoteConfig!.getBool(_Keys.showMainBanner);
  String get remoteAppTitle => _remoteConfig!.getString(_Keys.remoteAppTitle);
```

```dart
class _Keys {
  static String showMainBanner = "show_main_banner";
  static String remoteAppTitle = "app_title";
}
```

So, you'll have to add `show_main_banner (boolean value)` and `app_title (string value)` keys in firebase remote config console.

🎉 Bingo!😉 You can start running and testing your app.


_____

### GDG Yangon 2023 Powerpoint Slides

My slides for GDG Yangon 2023: https://speakerdeck.com/ye_lwin_oo/server-driven-ui-in-flutter


### I'm also implementing a small web project for parsing Mirai JSON syntax to Flutter UI on the fly. Feel free to test at https://mirai-json-parser.vercel.app/
