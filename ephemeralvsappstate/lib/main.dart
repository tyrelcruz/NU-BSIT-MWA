import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeModel(),
      child: const StateManagementActivity(),
    ),
  );
}

class StateManagementActivity extends StatelessWidget {
  const StateManagementActivity({super.key});

  @override
  Widget build(BuildContext context) {
    final themeModel = Provider.of<ThemeModel>(context);
    return MaterialApp(
      theme: themeModel.isDark ? ThemeData.dark() : ThemeData.light(),
      home: const MyHomePage(),
    );
  }
}

class ThemeModel with ChangeNotifier {
  bool _isDark = false;
  bool get isDark => _isDark;

  void toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

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
    final themeModel = Provider.of<ThemeModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Combined Ephemeral & App State',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: themeModel.isDark ? Colors.white : Colors.black87,
          ),
        ),
        backgroundColor: themeModel.isDark ? Colors.grey[900] : Colors.blue,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Icon(
                  themeModel.isDark ? Icons.dark_mode : Icons.light_mode,
                  color: themeModel.isDark ? Colors.white : Colors.black87,
                ),
                const SizedBox(width: 8),
                Switch(
                  value: themeModel.isDark,
                  onChanged: (_) => themeModel.toggleTheme(),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: TextStyle(
                fontSize: 13,
                color: themeModel.isDark ? Colors.white70 : Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              '$_counter',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: themeModel.isDark ? Colors.white : Colors.blue[700],
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: _incrementCounter,
              icon: const Icon(Icons.add),
              label: const Text('Increment Counter'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                backgroundColor: themeModel.isDark
                    ? Colors.blue[600]
                    : Colors.blue,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
