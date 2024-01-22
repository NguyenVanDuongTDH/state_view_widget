# view_controll
add to pubspec.yaml
```yaml
dependencies:
  state_view_widget:
    git:
      url: https://github.com/NguyenVanDuongTDH/state_view_widget.git
```

Visual studio code
File -> Preferences -> Configure User Snippets
```json
{
	"StateViewWidget": {
		"prefix": "stv",
		"body": [
		  "",
		  "class ${1:MyView} extends StateViewWidget {",
		  "  ${1:MyView}({Key? key}) : super(key: key);",
		  "",
		  "  @override",
		  "  Widget view(BuildContext context) {",
		  "    return ${1:MyView}Widget(model: this);",
		  "  }",
		  "}",
		  "",
		  "class ${1:MyView}Widget extends StatelessWidget {",
		  "  final ${1:MyView} model;",
		  "  const ${1:MyView}Widget({required this.model, Key? key}) : super(key: key);",
		  "",
		  "  @override",
		  "  Widget build(BuildContext context) {",
		  "    return const Placeholder();",
		  "  }",
		  "}",
		],
		"description": "StateViewWidget Template"
	  }
}	    
```

Example
```dart
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:state_view_widget/consumer.dart';
import 'package:state_view_widget/state_view_widget.dart';

// MyView myView = MyView();

// void main() {
//   runApp(MaterialApp(home: myView));
// }

void main() {
  runApp(MaterialApp(home: MyView()));
}

class MyView extends StateViewWidget {
  MyView({super.key});

  final ConsumerKey countKey = ConsumerKey();

  int count = 0;
  void incrementAll() {
    count++;
    reBuild();
  }

  void incrementOnely() {
    count++;
    countKey.reBuild();
  }

  @override
  StateView<MyView> createState() => _MyViewState();
}

class _MyViewState extends StateView<MyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: model.incrementAll,
            child: Text("${model.count}"),
          ),
          const SizedBox(height: 50),
          Consumer(
            key: model.countKey,
            child: () => ElevatedButton(
                onPressed: model.incrementOnely, child: Text("${model.count}")),
          )
        ],
      )),
    );
  }
}


```


