import "package:flutter/material.dart";
// creating a stateful widget in flutter.
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
 @override
 _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {

int _currentStep = 0;


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
              onPressed: () {},
            )
          ],
         ),
          body: Center(
             child: Stepper(
              steps:  const [
                Step(
                   title: Text('Step 1'),
                   content: Text('Information for step 1.')
                ),
                Step(
                   title: Text('Step 2'),
                   content: Text('Information for step 2.')
                ),
                Step(
                   title: Text('Step 3'),
                   content: Text('Information for step 3.')
                ),
              ],

              onStepTapped: (int newIndex){
                   setState(() {
                     _currentStep = newIndex;
                   });
              },

              currentStep: _currentStep,

              onStepContinue: (){
                if( _currentStep != 2){
                  setState(() {
                    _currentStep += 1;
                  });
                }
              },

              onStepCancel: (){
                if(_currentStep != 0){
                  setState(() {
                    _currentStep -= 1;
                  });
                }
              },

              )
          ))
      ); 
  }
}