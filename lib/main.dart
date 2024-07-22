import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/input': (context) => MyInputPage(),
        '/hasil': (context) => ResultPage(),
        '/counter': (context) => MyCounterPage(),
      },
      // home: MyInputPage(),
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: Text('Styling Example'),
      //   ),
      //   body: Center(
      //     child: Container(
      //       padding: EdgeInsets.all(20),
      //       color: Colors.blue,
      //       child: Text(
      //         'Hello, Flutter University!',
      //         style: TextStyle(
      //           fontSize: 20,
      //           color: Colors.white,
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}

class GesturePage extends StatelessWidget {
  void handleTap() {
    print('Box tapped!');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Gesture Detector Example'),
        ),
        body: Center(
          child: GestureDetector(
            onTap: handleTap,
            child: Container(
              color: Colors.blue,
              width: 200,
              height: 200,
              child: Center(
                child: Text(
                  'Tap me',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyInputPage extends StatelessWidget {
  final TextEditingController textController = TextEditingController();
  void handleSubmit() {
    print('User Input: ${textController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Input User")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: textController,
              decoration: InputDecoration(labelText: 'Enter something'),
            ),
            ElevatedButton(onPressed: handleSubmit, child: Text('Submit')),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/hasil',
                      arguments: textController.text);
                },
                child: Text('Go to results Page'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  // final String data;

  // SecondPage({required this.data});
  @override
  Widget build(BuildContext context) {
    final String data = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('Result Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Input user: $data'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back to input Page'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class MyCounterPage extends StatefulWidget {
  @override
  State<MyCounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<MyCounterPage> {
  int counter = 0;
  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("You have pushed the button this many times:"),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  String text = 'Hello, Flutter University!';

  void changeText() {
    setState(() {
      text = 'You pressed the button!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful Widget Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              text,
            ),
            ElevatedButton(
              onPressed: changeText,
              child: Text('Press me'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/input');
              },
              child: Text('Go to input page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/counter');
              },
              child: Text('Go to counter page'),
            ),
            Image.asset('assets/email.png')
          ],
        ),
      ),
    );
  }
}
