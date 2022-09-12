import "package:flutter/material.dart";

// creating a stateful widget in flutter.
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
 @override
 _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
 
  @override
   Widget build(BuildContext context) {
      return  MaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: ThemeData(primaryColor: Colors),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('TestWidgets'),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                 Slider.adaptive(
                  value: 0.5, 
                  onChanged: (double newValue) {}
                ),

                SwitchListTile.adaptive(
                  title: const Text(" Switch List Tile"),
                  value: true, 
                  onChanged: (bool newValue) {},

                ),

                Switch.adaptive(
                  value: true, 
                  onChanged: (bool newValue) {}
                ),

                Icon(
                  Icons.adaptive.share
                ),

                const CircularProgressIndicator.adaptive(),
              ],
            ) ,
          )
        )
      ); 
  }
}

