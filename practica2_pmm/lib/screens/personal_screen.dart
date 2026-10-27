import 'package:flutter/material.dart';

class PersonalPage extends StatefulWidget {

  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Page'),
      ),
    );
  }
}