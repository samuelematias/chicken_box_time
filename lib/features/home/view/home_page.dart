import 'package:chicken_box_time/flavor/flavor.dart';
import 'package:chicken_box_time/l10n/l10n.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

/// The widget responsible for creating the [MyHomePage],
class MyHomePage extends StatefulWidget {
  /// Creates a new instance of [MyHomePage].
  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  /// Receive the [title] as [String].
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final flavor = Flavor.whatIsTheFlavor;
    final flavorName = flavor.getFlavorName();
    final flavorColor = flavor.getFlavorColor();
    final theme = AppTheme.of(context);
    final colorTheme = theme.colors;
    return Scaffold(
      backgroundColor: colorTheme.background,
      appBar: AppBar(
        backgroundColor: colorTheme.brand,
        title: Text(
          'You are running $flavorName App',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Your Flavor is $flavorName'),
                Icon(
                  Icons.icecream,
                  color: flavorColor,
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'You have pushed the button this many times:',
            ),
            const SizedBox(height: 16),
            Text(l10n.counterAppBarTitle),
            const SizedBox(height: 16),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorTheme.brand,
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
