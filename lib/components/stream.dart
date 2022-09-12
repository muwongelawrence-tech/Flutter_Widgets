import "package:flutter/material.dart";

// creating a stateful widget in flutter.
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

//Simulating a fake firebase stream
Stream<int> generateStream = (() async* {
  await Future<void>.delayed(const Duration(seconds: 2));
  yield 1;

  await Future<void>.delayed(const Duration(seconds: 2));
  yield 2;

  await Future<void>.delayed(const Duration(seconds: 2));
  yield 3;

  throw 'An error occured';
})();

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: ThemeData(primaryColor: Colors),
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Test Widgets'),
              backgroundColor: Colors.green[900],
              leading: const Icon(Icons.home),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                )
              ],
            ),
            body: Center(
              child: StreamBuilder(
                stream: generateStream,
                initialData: 0,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator.adaptive();
                  }

                  if (snapshot.hasError) {
                    return const Text("an Error occured ");
                  } else {
                    return Text(
                      snapshot.data.toString(),
                      style: const TextStyle(fontSize: 40),
                    );
                  }
                },
              ),
            )));
  }
}
