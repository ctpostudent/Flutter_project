import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}


const List<String> company = [
  "Microsoft",
  "Google",
  "Amazon",
  "Apple",
  "Samsung",
];

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: UserList(),
          // child: ListView.separated(
          //   itemCount: min(users.length, company.length),
          //   itemBuilder: (context, index) {
          //     return Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Text(users[index]),
          //         Text("Место работы: ${company[index]}"),
          //       ],
          //     );
          //   },
          //   separatorBuilder: (context, index) {
          //     return Divider(
          //       height: 40,
          //       color: index % 2 == 0? Colors.green : Colors.red,
          //       thickness: 10,
          //       indent: 10,
          //       endIndent: 30,
          //     );
          //   },
          // ),
        ),
      ),
    );
  }
}

class UserList extends StatefulWidget{
  const UserList({super.key});

  @override
  State<StatefulWidget> createState() => _UserListState();
}

class _UserListState extends State<UserList>{
  final List<String> users = ["Tom", "Bob", "Alice", "Sam", "Kate"];
  int selectedItem = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(selectedItem == -1 ? "Не выбрано" : "Выбрано: ${users[selectedItem]}"),
        Expanded(
          child: ListView.builder(
            itemCount: users.length,
            itemBuilder: _createListView
          )
        )
      ],
    );
  }

  Widget _createListView(BuildContext context, int index) {
    // return GestureDetector(
    //   onTap: () => setState(() {
    //     selectedItem = index;
    //   }),
    //   child: Container(
    //     margin: EdgeInsets.symmetric(vertical: 4),
    //     padding:  EdgeInsets.symmetric(vertical: 8),
    //     color: index == selectedItem ? Colors.black12 : Colors.transparent,
    //     child: Text(users[index]),
    //   ),
    // );
    return ListTile(
      onTap: () => setState(() {
        selectedItem = index;
      }),
      title: Text(users[index]),
      tileColor: index == selectedItem ? Colors.black12 : Colors.transparent,
      leading: Icon(Icons.verified_user),
    );
  }

}