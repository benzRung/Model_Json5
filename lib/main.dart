import 'package:flutter/material.dart';
import 'dart:async';
import 'Services.dart';
import 'models/users.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Users users;
  late String title;

  @override
  void initState(){
    super.initState();
    title = 'Loading user...';
    users = Users();
    
    Services.getUsers().then((userFromServer){
      setState(() {
       users =  userFromServer;
       title = widget.title;
      });
    });
  }
  Widget list(){
    return Expanded(
      child: ListView.builder(
        itemCount: users.users == null ? 0 : users.users.length,
        itemBuilder: (BuildContext context, index) {
          return row(index);
        },
        ),
      ); 
  }

  Widget row(int index){
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              users.users[index].name,
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(
              users.users[index].email.toLowerCase(),
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
  
  Widget searchTF(){
    return TextField(
      decoration:  const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(
            5.0,
          )),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.all(15.0),
        hintText: 'Fillter by name or email',
      ),
      onChanged: (string){},
    );
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            searchTF(),
            const SizedBox(
              height: 10.0,
            ),
            list(),
          ],
        ),
      )
      
    );
  }
}
