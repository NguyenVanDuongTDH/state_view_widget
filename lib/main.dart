import 'package:flutter/material.dart';
import 'package:state_view_widget/consumer.dart';
import 'package:state_view_widget/state_view_widget.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  WidgetRef ref = WidgetRef();
  late final x = Consumer(ref: ref, child: (ref) => Text("OKOK"));
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(onPressed: () {}, child: const Text("OKOK")),
          Consumer(
            child: (ref) {
              return Text("OKOK");
            },
          )
        ],
      ),
    );
  }
}



class MyWidget extends StateViewWidget {
  MyWidget({super.key});
  
  // @override
  // State<StatefulWidget> createState() {
  //   // TODO: implement createState
  //   throw UnimplementedError();
  // }
  int x = 0;
  @override
  State<MyWidget> createState() => MyWidgetState();
}

class MyWidgetState extends StateView<MyWidget> {

  @override
  Widget build(BuildContext context) {
    
  return const Placeholder();
  }
}