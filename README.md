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
import 'package:state_view_widget/state_view_widget.dart';

void main() {
  runApp(MaterialApp(home: Scaffold(body: MyView())));
}

class MyView extends StateViewWidget {
  MyView({Key? key}) : super(key: key);

  int count = 0;
  void increment() => setState(() {
        count++;
      });

  @override
  Widget view(BuildContext context) {
    return MyViewWidget(model: this);
  }
}

class MyViewWidget extends StatelessWidget {
  final MyView model;
  MyViewWidget({required this.model, Key? key}) : super(key: key);

  final ConsumerKey _countKey = ConsumerKey();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        ElevatedButton(
            onPressed: () {
              model.count++;
            },
            child: Text("${model.count}")),
        ElevatedButton(
            onPressed: () {
              model.increment();
            },
            child: Text("${model.count}")),
        Consumer(
          key: _countKey,
          child: () => ElevatedButton(
              onPressed: () => _countKey.setState(() {
                    model.count++;
                  }),
              child: Text("${model.count}")),
        )
      ],
    ));
  }
}
```


