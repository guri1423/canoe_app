import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}
List<String> items = ['A', 'B', 'C'];
List<Color> _color = [Colors.transparent,Colors.transparent,Colors.transparent ];
class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(_color[index])),
              onPressed: () {
                setState(() {
                  if (_color[index] == Colors.blue) {
                    _color[index] = Colors.transparent;
                  } else {
                    _color[index] = Colors.blue;
                  }
                });
              },
              child: Text(items[index]),
            );
          },
        )
    );

  }
}
