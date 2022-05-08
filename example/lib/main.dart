import 'package:admonitions/admonitions.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Admonition Demo',
      home: MyHomePage(title: 'Admonition Demo'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SingleChildScrollView(
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
                'Classic Admonition',
                style: Theme.of(context).textTheme.headline5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
