import 'package:chicken_box_time/flavor/flavor.dart';
import 'package:chicken_box_time/l10n/l10n.dart';
import 'package:design_system/design_system.dart' as ds;
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
    final theme = ds.AppTheme.of(context);
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
                Text(
                  'Your Flavor is $flavorName',
                  style: TextStyle(
                    color: colorTheme.font,
                  ),
                ),
                Icon(
                  Icons.icecream,
                  color: flavorColor,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'You have pushed the button this many times:',
              style: theme.typography.titleLarge.copyWith(
                color: colorTheme.font,
              ),
              // style: TextStyle(
              //   color: colorTheme.font,
              // ),
            ),
            const SizedBox(height: 16),
            ds.Text(
              l10n.counterAppBarTitle,
              style: ds.CustomTextStyle.labelSmall,
            ),
            const SizedBox(height: 16),
            Text(
              '$_counter',
              style: TextStyle(
                color: colorTheme.font,
              ),
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
