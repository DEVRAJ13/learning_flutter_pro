import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.purple,
          buttonColor: Colors.purple,
          buttonTheme: const ButtonThemeData(
            textTheme: ButtonTextTheme.primary,
          )),
      home: const MyHomePage(),
    );
  }
}

class Kitten {
  const Kitten({this.name, this.description, this.age, this.imageUrl});

  final String name;
  final String description;
  final int age;
  final String imageUrl;
}

final List<Kitten> _kittens = <Kitten>[
  Kitten(
      name: "Chloe",
      description: "The cat or domestic cat is a small carnivorous mammal. It is the only domesticated species in the family Felidae.",
      age: 2,
      imageUrl:
          'https://images.unsplash.com/photo-1532386236358-a33d8a9434e3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'),
  Kitten(
      name: "Bella",
      description: "The cat or domestic cat is a small carnivorous mammal. It is the only domesticated species in the family Felidae.",
      age: 5,
      imageUrl: 'https://ichef.bbci.co.uk/images/ic/720x405/p0517py6.jpg'),
  Kitten(
      name: "Lucy",
      description: "The cat or domestic cat is a small carnivorous mammal. It is the only domesticated species in the family Felidae.",
      age: 4,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbviSJcx2a4U01BRinV9aTIrdxUBzy9ZCHs2WdNG49aanJilZG'),
  Kitten(
      name: "Sophie",
      description: "The cat or domestic cat is a small carnivorous mammal. It is the only domesticated species in the family Felidae.",
      age: 4,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQU99qh--YWQLS0Q6nGJ802RAo8fntW8aTR8zCscXxNqFf5d9b8'),
];

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  Widget _dialogBuilder(BuildContext context, Kitten kitten) {
    ThemeData localTheme = Theme.of(context);

    return SimpleDialog(
      contentPadding: EdgeInsets.zero,
      children: <Widget>[
        Image.network(
          kitten.imageUrl,
          fit: BoxFit.fill,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                kitten.name,
                style: localTheme.textTheme.display1,
              ),
              Text(
                '${kitten.age} months old',
                style: localTheme.textTheme.subhead
                    .copyWith(fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 16.0),
              Text(
                kitten.description,
                style: localTheme.textTheme.body1,
              ),
              SizedBox(height: 16.0),
              Align(
                alignment: Alignment.centerRight,
                child: Wrap(
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('I\'M ALLERGIC'),
                    ),
                    RaisedButton(
                      onPressed: () {},
                      child: const Text('ADOPT'),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _listItemBuilder(BuildContext context, int index) {
    return new GestureDetector(
        onTap: () => showDialog(
            context: context,
            builder: (context) => _dialogBuilder(context, _kittens[index])),
        child: Container(
            padding: const EdgeInsets.only(left: 16.0),
            alignment: Alignment.centerLeft,
            child: Text(_kittens[index].name,
                style: Theme.of(context).textTheme.headline)));
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
