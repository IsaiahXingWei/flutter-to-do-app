import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        // theme: ThemeData.dark(),
        home: HomePage()
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

final myTitle = TextEditingController();
final desc = TextEditingController();

List toDoTitle = [];
List toDoDesc = [];


class _HomePageState extends State<HomePage> {
  int count = 0;
  int currentIndex = 0;


  addItem() {
  setState(() {
    toDoTitle.add(myTitle.text);
    toDoDesc.add(desc.text);
  });
    myTitle.clear();
    desc.clear();
  }


  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>[];

    final List<Color> colorCodes = <Color>[];

    return Scaffold(
      appBar: AppBar(
        title: Text("AppBar"),
        centerTitle: true,
      ),
      body: Column(
        children: [
           TextField(
             keyboardType: TextInputType.multiline,
            maxLines: 3,
            controller: myTitle,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText:'Title',
            ),
          ),
           TextField(
             keyboardType: TextInputType.multiline,
            maxLines: 3,
            controller: desc,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText:'Description',
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: toDoTitle.length,
              itemBuilder: (BuildContext context, int index) {
                return Card (
                  child: ListTile(
                      title: Text(toDoTitle[index]),
                      subtitle: Text(toDoDesc[index], maxLines: 3),
                  ),
            );
          }
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addItem,
          child: Icon(Icons.add)
        ),
      );
  }
}