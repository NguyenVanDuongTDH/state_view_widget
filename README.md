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
	
				"class ${1:ViewWidget} extends StateViewWidget {",
				"  ${1:ViewWidget}({super.key});",
				  
				"  @override",
				"  StateView<${1:ViewWidget}> createState() => ${1:ViewWidget}State();",
				"}",
				"",
				"class ${1:ViewWidget}State extends StateView<${1:ViewWidget}> {",
				"  @override",
				"  Widget view(BuildContext context) {",
				"  return const Placeholder();",
				"  }"
				"}"
	
			],
			"description": "StateViewWidget Template"
		  }
	   
} 
```

Example
```dart
// ignore_for_file: must_be_immutable

import 'package:state_view_widget/consumer.dart';
import 'package:state_view_widget/state_view_widget.dart';


void main() {
  runApp(MaterialApp(home: MyView()));
}

class MyView extends StateViewWidget {
  MyView({super.key});

  final WidgetRef countRef = WidgetRef();

  int count = 0;
  void incrementAll() {
    count++;
    reBuild();
  }

  void incrementOnely() {
    count++;
    countRef.reBuild();
  }

  @override
  StateView<MyView> createState() => _MyViewState();
}

class _MyViewState extends StateView<MyView> {
  @override
  Widget view(BuildContext context) {
    
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
            ref: model.countRef,
            child: () => ElevatedButton(
                onPressed: model.incrementOnely, child: Text("${model.count}")),
          )
        ],
      )),
    );
  }
}


```

Example View
```dart
class MyWidget extends StateViewWidget {
  MyWidget({super.key});
  @override
  StateView<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends StateView<MyWidget> {
  @override
  Widget view(BuildContext context) {
  return const Placeholder();
  }
}
```


