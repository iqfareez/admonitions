import 'package:admonitions/admonitions.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _theme = ThemeMode.system;

  // Cycle the theme
  void _toggleTheme() {
    setState(() {
      switch (_theme) {
        case ThemeMode.light:
          _theme = ThemeMode.dark;
          break;
        case ThemeMode.dark:
          _theme = ThemeMode.system;
          break;
        case ThemeMode.system:
          _theme = ThemeMode.light;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Admonition Demo',
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: _theme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Admonition Demo'),
          actions: [
            IconButton(
              tooltip: "Toggle light/dark/system theme",
              onPressed: _toggleTheme,
              icon: Icon(
                switch (_theme) {
                  ThemeMode.light => Icons.light_mode_rounded,
                  ThemeMode.dark => Icons.dark_mode_rounded,
                  ThemeMode.system => Icons.brightness_auto_rounded,
                },
              ),
            )
          ],
        ),
        body: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Solid Admonition',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SolidAdmonition.note(
              text: '(Note) You might read this, you might not.',
            ),
            const SolidAdmonition.tip(
              text: '(Tip) You want to read this.',
            ),
            const SolidAdmonition.info(
              text: '(Info/Important) You should read this.',
            ),
            const SolidAdmonition.caution(
              text: '(Caution) I hope you read this.',
            ),
            const SolidAdmonition.danger(
              text: '(Danger) You need to read this.',
            ),
            const SolidAdmonition(
              text:
                  '(Raw) Background colour is defaulted to your app primary colour.',
            ),
            const Divider(),
            Text(
              'Pastel Admonition',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const PastelAdmonition.note(
              text: '(Note) You might read this, you might not.',
            ),
            const PastelAdmonition.tip(
              text: '(Tip) You want to read this.',
            ),
            const PastelAdmonition.info(
              text: '(Info/Important) You should read this.',
            ),
            const PastelAdmonition.caution(
              text: '(Caution) I hope you read this.',
            ),
            const PastelAdmonition.danger(
              text: '(Danger) You need to read this.',
            ),
            const PastelAdmonition(
              text:
                  '(Raw) Background colour is defaulted to your app primary colour.',
            ),
            const Divider(),
            Text(
              '...with actions',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            PastelAdmonition.caution(
              text: '(Caution) I hope you read this. With action button below.',
              actions: [
                TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor:
                          Theme.of(context).textTheme.bodyLarge!.color,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      textStyle: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).removeCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Button 1 pressed'),
                        behavior: SnackBarBehavior.floating,
                      ));
                    },
                    child: const Text('Action 1')),
                TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor:
                          Theme.of(context).textTheme.bodyLarge!.color,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      textStyle: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).removeCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Button 2 pressed'),
                        behavior: SnackBarBehavior.floating,
                      ));
                    },
                    child: const Text('Action 2'))
              ],
            ),
            SolidAdmonition.info(
              text:
                  '(Info/Important) You should read this. With action button below.',
              actions: [
                TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor:
                          Theme.of(context).textTheme.bodyLarge!.color,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      textStyle: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).removeCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Button 1 pressed'),
                        behavior: SnackBarBehavior.floating,
                      ));
                    },
                    child: const Text('Action 1')),
                TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor:
                          Theme.of(context).textTheme.bodyLarge!.color,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      textStyle: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).removeCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Button 2 pressed'),
                        behavior: SnackBarBehavior.floating,
                      ));
                    },
                    child: const Text('Action 2'))
              ],
            ),
            const Divider(),
            Text(
              'Classic Admonitions',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const ClassicAdmonition.note(
              text: '(Note) You might read this, you might not.',
            ),
            const ClassicAdmonition.tip(
              text: '(Tip) You want to read this.',
            ),
            const ClassicAdmonition.info(
              text: '(Info/Important) You should read this.',
            ),
            const ClassicAdmonition.caution(
              text: '(Caution) I hope you read this.',
            ),
            const ClassicAdmonition.danger(
              text: '(Danger) You need to read this.',
            ),
            const ClassicAdmonition(
              text:
                  '(Raw) Background colour is defaulted to your app primary colour.',
            ),
          ],
        ),
      ),
    );
  }
}
