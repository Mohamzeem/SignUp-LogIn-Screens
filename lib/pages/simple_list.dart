import 'package:flutter/material.dart';

class SimpleList extends StatefulWidget {
  const SimpleList({super.key});

  @override
  State<SimpleList> createState() => _SimpleListState();
}

class _SimpleListState extends State<SimpleList> {
  List<int> numbers = [];
  int id = UniqueKey().hashCode;

  void add({required int addIndex}) {
    setState(() {
      numbers.add(addIndex);
    });
  }

  void remove({required int removeIndex}) {
    setState(() {
      numbers.removeAt(removeIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Simple List'),
        ),
        body: ListView.builder(
            itemCount: numbers.length,
            reverse: false,
            clipBehavior: Clip.none,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.amber,
                  child: ListTile(
                    title: Text(' Item $index'),
                    trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          id = index;
                          remove(removeIndex: id);
                        });
                      },
                      icon: const Icon(
                        Icons.delete,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            add(addIndex: id);
          },
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.black,
          child: const Icon(
            Icons.add,
            size: 30,
          ),
        ));
  }
}
