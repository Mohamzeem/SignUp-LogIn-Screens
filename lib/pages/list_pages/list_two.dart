import 'package:flutter/material.dart';

class ListTwo extends StatefulWidget {
  const ListTwo({super.key});

  @override
  State<ListTwo> createState() => _ListTwoState();
}

class _ListTwoState extends State<ListTwo> {
  List<Widget> widgets = [];
  int currentIndex = 0;
  List<int> numbers = [];
  int id = UniqueKey().hashCode;

  void add({required Widget widget, required int addIndex}) {
    setState(() {
      widgets.add(widget);
      numbers.add(addIndex);
    });
  }

  void remove({required int removeIndex}) {
    setState(() {
      widgets.removeAt(removeIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List'), centerTitle: true),
      body: Column(children: [
        IconButton(
          onPressed: () {
            add(
                widget: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Item $id')),
                addIndex: id);
          },
          icon: const Icon(Icons.add),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: widgets.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.amber,
                  child: Row(
                    children: [
                      widgets[index],
                      IconButton(
                          onPressed: () {
                            id = index;
                            remove(removeIndex: id);
                          },
                          icon: const Icon(Icons.delete)),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            widgets.clear();
            numbers.clear();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
