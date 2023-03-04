import 'package:flutter/material.dart';

class SimpleList extends StatefulWidget {
  const SimpleList({super.key});

  @override
  SimpleListState createState() => SimpleListState();
}

class SimpleListState extends State<SimpleList> {
  List<ServiceCard> serviceCardList = [];

  void removeCard(index) {
    setState(() {
      serviceCardList.remove(index);
    });
  }

  void addCard(index) {
    setState(() {
      serviceCardList.add(index);
    });
  }

  @override
  void initState() {
    super.initState();
    // serviceCardList = List.generate(
    //     0,
    //     (index) => ServiceCard(
    //           addCard,
    //           index: index,
    //         ));
  }

  @override
  Widget build(BuildContext context) {
    print('build + ${serviceCardList.length}');
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: IconButton(
          onPressed: () {
            addCard(this);
          },
          icon: Icon(Icons.add)),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ServiceCard((p0) => null, index: index);
        },
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final int index;
  final Function(ServiceCard) removeServiceCard;

  const ServiceCard(this.removeServiceCard, {Key? key, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.grey,
        child: ListTile(
          title: Text(
              'Index: ${index.toString()} Hashcode: ${this.hashCode.toString()}'),
          trailing: IconButton(
            // color: Colors.accents.elementAt(3 * index),
            onPressed: () {
              removeServiceCard(this);
            },
            icon: const Icon(Icons.delete),
          ),
        ),
      ),
    );
  }
}
