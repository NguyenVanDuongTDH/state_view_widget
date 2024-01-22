# view_controll
add to pubspec.yaml
```yaml
dependencies:
  view_controll:
    git:
      url: https://github.com/NguyenVanDuongTDH/view_controll.git
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
import 'package:view_controll/view_controll.dart';

CounterPage counterPage = CounterPage();

void main() {
  runApp(MaterialApp(home: counterPage));
}

// ignore: must_be_immutable
class CounterPage extends StateViewWidget {
  CounterPage({Key? key}) : super(key: key);

  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    reload();
  }

  @override
  Widget view(BuildContext context) {
    return CounterPageWidget(model: this);
  }
}




class CounterPageWidget extends StatelessWidget {
  final CounterPage model;
  const CounterPageWidget({required this.model, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "${model.count}",
          style: const TextStyle(fontSize: 21),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          model.increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
```


