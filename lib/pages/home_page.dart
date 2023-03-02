// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<int> numbers = [];
  int currentIndex = 0;

  void add({required int widgetIndex}) {
    setState(() {
      currentIndex = widgetIndex;
      numbers.add(currentIndex);
    });
  }

  void remove({required int removeIndex}) {
    setState(() {
      numbers.removeAt(currentIndex);
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
                print(numbers);
              });
            }),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  // numbers.add(currentIndex++);
                  // numbers.add(currentIndex++);
                  //print('add $currentIndex');
                  add(widgetIndex: currentIndex);
                  print(numbers);
                },
                icon: const Icon(Icons.add)),
            Expanded(
              child: AnimationLimiter(
                child: ListView.builder(
                    // shrinkWrap: false,
                    reverse: false,
                    controller: ScrollController(),
                    // physics: const BouncingScrollPhysics(
                    //     parent: AlwaysScrollableScrollPhysics()),
                    itemCount: numbers.length,
                    itemBuilder: (context, index) {
                      return AnimationConfiguration.synchronized(
                        duration: const Duration(seconds: 1),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SlideAnimation(
                            verticalOffset: 5000,
                            delay: Duration(seconds: 15),
                            duration: Duration(seconds: 15),
                            child: Container(
                              color: Colors.amber.shade300,
                              child: ListTile(
                                title: Text(
                                  'Number    $index',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20),
                                ),
                                trailing: IconButton(
                                    onPressed: () {
                                      currentIndex = index;
                                      remove(removeIndex: currentIndex);
                                      print('___________');
                                      print('index $index');
                                      print(numbers);
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.black,
                                    )),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            )
          ],
        ));
  }
}
