import 'package:flutter/material.dart';
import 'package:flutter_design_system/flutter_design_system.dart';

import 'my_theme/my_dark_theme.dart';
import 'my_theme/my_light_theme.dart';

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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Design System',
      theme: context.themeManager.themeData,
      debugShowCheckedModeBanner: false,
      home: const SamplePage(),
    );
  }
}

class SamplePage extends StatefulWidget {
  const SamplePage({super.key});

  @override
  State<SamplePage> createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  int count = 1;
  int colorIndex = 0;
  bool get isLightTheme => context.theme.brightness == Brightness.light;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Design System'),
        titleSpacing: 16,
        actions: [
          /// Theme
          Button(
            type: ButtonType.flat,
            color:
                isLightTheme ? context.color.secondary : context.color.tertiary,
            icon: isLightTheme ? 'sunny-outline.svg' : 'moon-outline.svg',
            onPressed: () {
              context.rThemeManager.toggleTheme();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: HideKeyboard(
          child: Column(
            children: [
              const SizedBox(width: double.infinity),

              /// Button
              buildButton(),

              /// AssetIcon
              buildAssetIcon(context),

              /// InputField
              buildInputField(),

              /// Tile
              buildTile(),

              /// ColorPicker
              buildColorPicker(),

              /// CounterButton
              buildCounterButton(),

              /// Rating
              buildRating(),

              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                runSpacing: 16,
                spacing: 16,
                children: [
                  /// Toast
                  buildToast(context),

                  /// Dialog
                  buildDialog(context),

                  /// BottomSheet
                  buildBottomSheet(context),
                ],
              ),
            ]
                .map((e) => Padding(
                      padding: const EdgeInsets.all(16),
                      child: e,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }

  Button buildBottomSheet(BuildContext context) {
    return Button(
      text: 'Show bottom sheet',
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return BaseBottomSheet(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Hello Bottom Sheet",
                      style: context.font.headline3,
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Button buildDialog(BuildContext context) {
    return Button(
      text: 'Show dialog',
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return BaseDialog(
              title: 'Dialog title',
              content: Text(
                'Dialog content',
                style: context.font.headline6,
              ),
              actions: [
                Button(
                  text: 'Cancel',
                  color: context.color.onSecondary,
                  backgroundColor: context.color.secondary,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Button(
                  text: 'Confirm',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  Button buildToast(BuildContext context) {
    return Button(
      text: 'Show toast',
      onPressed: () {
        context.toast('Hello I\'m toast');
      },
    );
  }

  Rating buildRating() => const Rating(rating: '5.0');

  Widget buildInputField() => const SizedBox(
        width: 500,
        child: InputField(
          hint: 'InputField',
        ),
      );

  Widget buildTile() {
    return SizedBox(
      width: 500,
      child: Tile(
        icon: 'moon-outline.svg',
        title: 'title',
        subtitle: 'subtitle',
        onPressed: () {},
      ),
    );
  }

  ColorPicker buildColorPicker() {
    return ColorPicker(
      colorIndex: colorIndex,
      colorList: const [
        Colors.amber,
        Colors.pink,
        Colors.purple,
        Colors.blue,
      ],
      onSelected: (index) {
        setState(() {
          colorIndex = index;
        });
      },
    );
  }

  CounterButton buildCounterButton() {
    return CounterButton(
      count: count,
      onChanged: (v) {
        setState(() {
          count = v;
        });
      },
    );
  }

  Widget buildButton() {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.center,
      spacing: 16,
      runSpacing: 16,
      children: [
        Button(
          text: "small-fill",
          size: ButtonSize.small,
          type: ButtonType.fill,
          onPressed: () {},
        ),
        Button(
          text: "medium-fill",
          size: ButtonSize.medium,
          type: ButtonType.fill,
          onPressed: () {},
        ),
        Button(
          text: "large-fill",
          size: ButtonSize.large,
          type: ButtonType.fill,
          onPressed: () {},
        ),
        Button(
          text: "small-outline",
          size: ButtonSize.small,
          type: ButtonType.outline,
          onPressed: () {},
        ),
        Button(
          text: "medium-outline",
          size: ButtonSize.medium,
          type: ButtonType.outline,
          onPressed: () {},
        ),
        Button(
          text: "large-outline",
          size: ButtonSize.large,
          type: ButtonType.outline,
          onPressed: () {},
        ),
        Button(
          text: "small-flat",
          size: ButtonSize.small,
          type: ButtonType.flat,
          onPressed: () {},
        ),
        Button(
          text: "medium-flat",
          size: ButtonSize.medium,
          type: ButtonType.flat,
          onPressed: () {},
        ),
        Button(
          text: "large-flat",
          size: ButtonSize.large,
          type: ButtonType.flat,
          onPressed: () {},
        ),
      ],
    );
  }
}

Widget buildAssetIcon(BuildContext context) {
  return Wrap(
    crossAxisAlignment: WrapCrossAlignment.center,
    alignment: WrapAlignment.center,
    spacing: 24,
    runSpacing: 16,
    children: [
      'arrow-back-outline.svg',
      'basket-outline.svg',
      'checkmark-outline.svg',
      'chevron-forward-outline.svg',
      'close-outline.svg',
      'language-outline.svg',
      'minus-outline.svg',
      'moon-outline.svg',
      'option-outline.svg',
      'plus-outline.svg',
      'search-outline.svg',
      'star-fill.svg',
      'sunny-outline.svg',
      'uncheckmark-outline.svg',
    ]
        .map((e) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AssetIcon(e),
                const SizedBox(height: 8),
                Text(
                  e,
                  style: context.font.body2,
                ),
              ],
            ))
        .toList(),
  );
}
