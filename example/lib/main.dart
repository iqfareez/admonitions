import 'package:admonitions/admonitions.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _theme = ThemeMode.light;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Admonition Demo',
      themeMode: _theme,
      darkTheme: ThemeData.dark(),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Admonition Demo'),
            actions: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      _theme = _theme == ThemeMode.light
                          ? ThemeMode.dark
                          : ThemeMode.light;
                    });
                  },
                  icon: Icon(_theme == ThemeMode.light
                      ? Icons.light_mode_outlined
                      : Icons.dark_mode_outlined))
            ],
          ),
          body: const MyHomePage()),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

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
              style: Theme.of(context).textTheme.headline5,
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
              style: Theme.of(context).textTheme.headline5,
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
              style: Theme.of(context).textTheme.headline6,
            ),
            PastelAdmonition.caution(
              text: '(Caution) I hope you read this. With action button below.',
              actions: [
                TextButton(
                    style: TextButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      primary: Theme.of(context).textTheme.bodyLarge!.color,
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
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      primary: Theme.of(context).textTheme.bodyLarge!.color,
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
          ],
        ),
      ),
    );
  }
}
