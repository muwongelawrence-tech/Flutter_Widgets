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
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate()
                );
              },
            )
          ],
         ),
          body: const Text("hi"))
      ); 
  }
}

// This is the delegate for the search application.
class CustomSearchDelegate extends SearchDelegate {

  List<String> searchTerms = [
    'Apple',
    'Banana',
    'Pear',
    'Watermelons',
    'Oranges'
    'Blueberries',
    'Strawberries',
    'Raspberries',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
       icon: const Icon(Icons.clear),
       onPressed: (){
        query = '';
       }
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
  return IconButton(
        icon:const Icon(Icons.arrow_back),
        onPressed: () {
          close( context, null);
        },
      );
    
  }

  @override
  Widget buildResults(BuildContext context){
    
    List<String> matchQuery = [];
    for (var fruit in searchTerms){
      if(fruit.toLowerCase().contains(query.toLowerCase())){
         matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index){
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

    @override
  Widget buildSuggestions(BuildContext context){
    List<String> matchQuery = [];
    for (var fruit in searchTerms){
      if(fruit.toLowerCase().contains(query.toLowerCase())){
         matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index){
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

}