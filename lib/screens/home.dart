import 'package:flutter/material.dart';

const c1 = 0xFFFDFFFC,
    c2 = 0xFFa2d2ff,
    c3 = 0xFF374B4A,
    c4 = 0xFFbde0fe,
    c5 = 0xFF293241,
    c6 = 0xFFf8f9fa,
    c7 = 0x80374B4A,
    c8 = 0x3300B1CC,
    c9 = 0xCCFF595E;

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SUPER NOTE',
      home: Scaffold(
        backgroundColor: Color(c6),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(c2),
          brightness: Brightness.dark,
          title: Text(
            'Super Note',
            style: TextStyle(color: const Color(c5)),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.add,
            color: const Color(c5),
          ),
          tooltip: 'New Notes',
          backgroundColor: const Color(c4),
          onPressed: () => {},
        ),
      ),
    );
  }
}
