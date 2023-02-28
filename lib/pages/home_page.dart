import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<dynamic, dynamic>> numbers = [];
  int currentIndex = 0;
  void increment() {
    currentIndex++;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    // increment();
                    numbers.add();
                    // print('$currentIndex');
                    // print(numbers[index]);
                  });
                },
                icon: const Icon(Icons.add)),
            Expanded(
              child: AnimationLimiter(
                child: ListView.builder(
                    // shrinkWrap: false,
                    reverse: true,
                    controller: ScrollController(),
                    // physics: const BouncingScrollPhysics(
                    //     parent: AlwaysScrollableScrollPhysics()),
                    itemCount: numbers.length,
                    itemBuilder: (context, index) {
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(seconds: 4),
                        delay: const Duration(seconds: 4),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SlideAnimation(
                            verticalOffset: 5000,
                            child: Container(
                              color: Colors.amber.shade300,
                              child: ListTile(
                                title: Text(
                                  'Number    ${index}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20),
                                ),
                                trailing: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        // currentIndex = index;
                                        // numbers.removeWhere((element) => false);
                                        numbers.removeAt(index);
                                        // numbers.removeAt(index);
                                        // numbers.removeRange(start, end);
                                        print('$index');
                                      });
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
