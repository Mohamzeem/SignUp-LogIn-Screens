// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: avoid_print
import 'package:flutter/material.dart';

class ListOne extends StatefulWidget {
  const ListOne({super.key});

  @override
  State<ListOne> createState() => _ListOneState();
}

class _ListOneState extends State<ListOne> {
  List<int> numbers = [];
  List<Widget> widgets = [];
  int currentIndex = 0;

  // @override
  // int get hashCode => super.hashCode;

  void add({required int widgetIndex, required Widget card}) {
    setState(() {
      widgets.add(card);
    });
  }

  void remove({required int removeIndex}) {
    setState(() {
      // currentIndex = removeIndex;
      // widgets.removeAt(removeIndex);
      widgets.removeAt(removeIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        floatingActionButton: IconButton(
            color: Colors.black,
            icon: const Icon(
              Icons.clear,
            ),
            onPressed: () {
              setState(() {
                numbers.clear();
              });
            }),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  add(
                      widgetIndex: currentIndex,
                      card: Card(
                        cardIndex: currentIndex,
                      ));
                  print(numbers);
                  print('add $currentIndex');
                },
                icon: const Icon(Icons.add)),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: false,
                  reverse: false,
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemCount: numbers.length,
                  itemBuilder: (context, index) {
                    final currentIndex = widgets[index];
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [widgets[index]],
                        ));
                    //   Container(
                    //       color: Colors.amber.shade300,
                    //       child: Card(
                    //         nameIndex: '$index',
                    //         cardIndex: index,
                    //         onPressed: () {
                    //           remove(removeIndex: index);
                    //         },
                    //       )),
                    // );
                  }),
            )
          ],
        ));
  }
}

class Card extends StatefulWidget {
  const Card(
      {Key? key, required this.cardIndex, this.onPressed, this.nameIndex})
      : super(key: key);
  final int cardIndex;
  final void Function()? onPressed;
  final String? nameIndex;

  @override
  State<Card> createState() => _CardState();
}

class _CardState extends State<Card> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Item ${widget.nameIndex} & Hash:$hashCode',
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
      ),
      trailing: IconButton(
        // color: Colors.accents.elementAt(3 * index),
        onPressed: widget.onPressed,
        icon: const Icon(Icons.delete),
      ),
    );
  }
}
