import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DevProfile M3'),
      ),
      body: Center(
        child:Container(
          color: Colors.amber,
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/personal');
                }, 
                child: Text('Personal Page')
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/widgets');
                }, 
                child: Text('Widget Page')
              )
            ]
          ),
        )
      ),
    );
  }
}