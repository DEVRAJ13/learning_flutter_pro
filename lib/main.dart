import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class Kitten {
  const Kitten ({
    this.name, this.description,
    this.age, this.imageUrl });

    final String name;
    final String description;
    final int age;
    final String imageUrl;
}

final List<Kitten> _kittens = <Kitten> [
  Kitten(
    name:"Mittens",
    description:"test",
    age:11,
    imageUrl:''
  ),
  Kitten(
    name:"Mittens",
    description:"test",
    age:11,
    imageUrl:''
  ),  Kitten(
    name:"Mittens",
    description:"test",
    age:11,
    imageUrl:''
  ),  Kitten(
    name:"Mittens",
    description:"test",
    age:11,
    imageUrl:''
  ),
];

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}):super(key:key);

  Widget _listItemBuilder(BuildContext context, int index) {
    return Text(_kittens[index].name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Kittens'),
      ),
      body: ListView.builder(
        itemCount: _kittens.length,
        itemExtent: 60.0,
        itemBuilder: _listItemBuilder,
      ),
      
    );
  }
}