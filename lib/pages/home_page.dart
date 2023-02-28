import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey keyForm = GlobalKey();
  List<int> numbers = [];
  int currentIndex = 0;
  // void increment() {
  //   currentIndex++;
  // }

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
                    numbers.add(currentIndex++);
                    print('add $currentIndex');
                    print(numbers);
                  });
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
                      return AnimationConfiguration.staggeredList(
                        position: currentIndex,
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
                                  'Number    $index',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20),
                                ),
                                trailing: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        currentIndex = index;
                                        numbers.removeAt(index);

                                        print('delete $index');
                                        print(numbers);
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
