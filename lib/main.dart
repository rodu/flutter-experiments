import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Welcome to Flutter',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Welcome to Flutter'),
          ),
          body: Center(
            child: RandomWords(),
          ),
        ));
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _biggerFont = TextStyle(fontSize: 18.0);
  final _suggestions = <WordPair>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Address Book'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 4, right: 15, bottom: 4),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image.asset('images/gravatar.jpg'),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (String val) => val,
            ),
            Expanded(child: _buildSuggestions()),
          ],
        ),
      ),
    );
  }

  Widget _buildSuggestions() {
    _suggestions.length = 0;
    _suggestions.addAll(generateWordPairs().take(50));

    return ListView(
      children: _suggestions.map((pair) => _buildRow(pair)).toList(),
    );
  }

  Widget _buildRow(WordPair pair) {
    final _icon = Icon(
      Icons.cake,
      color: Colors.red,
      size: 30,
    );

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          _icon,
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              pair.asPascalCase,
              style: _biggerFont,
            ),
          ),
        ],
      ),
    );
  }
}
