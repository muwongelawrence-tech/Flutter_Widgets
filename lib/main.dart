import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

// creating a stateful widget in flutter.
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
 @override
 _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 
 bool _isSelected = false;

  @override
   Widget build(BuildContext context) {
      return  MaterialApp(
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
              onPressed: () {
},
            )
          ],
         ),
          body: Center(
            child: ChoiceChip(
              label: const Text("choice chip"), 
              selected: _isSelected,
              onSelected: (newBoolValue) {
                setState((){
                  __isSelected = newBoolValue;
                });
              },
          ),
        )
        )
      ); 
  }
}

