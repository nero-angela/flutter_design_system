## Flutter Design System
This is Flutter design system & responsive tutorial package.


## Getting started
1. Install `flutter_design_system` package.
```bash
flutter pub add flutter_design_system
```

2. Wrap the root widget with `ThemeInjector`.
```dart
import 'package:flutter_design_system/flutter_design_system.dart';

void main() {
  runApp(
    const ThemeInjector(
      child: MyApp(),
    ),
  );
}
```

3. Pass `context.themeService.themeData` and `navigatorKey` to `MaterialApp`, and call `Toast.init()` in `builder`.
```dart
final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

@override
Widget build(BuildContext context) {
  return MaterialApp(
    navigatorKey: navigatorKey,
    theme: context.themeService.themeData,
    builder: (context, child) => Toast.init(navigatorKey, child),
    ...
  );
}
```

## Demo
[House of Tomorrow](https://github.com/nero-angela/flutter_house_of_tomorrow/tree/flutter_design_system)

## Feature
### Custom Theme
|Light Theme|Dark Theme|
|:-:|:-:|
|<video src="https://user-images.githubusercontent.com/26322627/220570237-39cf416b-89eb-416e-87ac-bfe6a680cb98.mov" width="300px">|<video src="https://user-images.githubusercontent.com/26322627/220570332-7cfa1801-d517-43db-ba4f-62ee7b36f5ef.mov" width="300px">|


You can also create custom light and dark theme by implements `AppTheme`.
```dart
class MyLightTheme implements AppTheme {}
class MyDarkTheme implements AppTheme {}
```

Inject your custom themes as below.
```dart
void main() {
  runApp(
    ThemeInjector(
      themeService: ThemeService(
        brightness: Brightness.dark, // Current theme
        lightTheme: MyLightTheme(), // My light theme
        darkTheme: MyDarkTheme(), // My dark theme
      ),
      child: const MyApp(),
    ),
  );
}
```

### Components
|Light Theme|Dark Theme|
|:-:|:-:|
|<img width="1148" alt="Light theme components image" src="https://user-images.githubusercontent.com/26322627/203027906-40934207-e4cd-4188-85db-18c76fd80324.png">|<img width="1143" alt="Dark theme components image" src="https://user-images.githubusercontent.com/26322627/203027911-63d24ccc-ac6b-4030-aca1-9ee22c027c6d.png">|

### Responsive UI
```dart
SizedBox(
    width: context.layout(
        100, // base(mobile)
        tablet: 200, // tablet
        desktop: 300, // desktop
    ),
);
```
<video src="https://user-images.githubusercontent.com/26322627/220571723-84f925f9-1a10-424e-903b-18a03a74c289.mov">
