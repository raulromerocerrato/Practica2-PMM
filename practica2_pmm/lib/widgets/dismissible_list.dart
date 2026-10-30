import 'package:flutter/material.dart';

class DismissibleList extends StatefulWidget {
  const DismissibleList({super.key});

  @override
  State<DismissibleList> createState() => _DismissibleListState();
}

class _DismissibleListState extends State<DismissibleList> {
  final List<String> _tasks = List.generate(10, (index) => 'Task ${index + 1}');

  void _eliminarTask(int index) {
    final task = _tasks[index];
    setState(() {
      _tasks.removeAt(index);
    });
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text('$task eliminada')),
    );
  }
  @override
  Widget build(BuildContext context) {
    if (_tasks.isEmpty) {
      return const Center(
        child: Text('No hi ha tasques pendents'),
      );
    }
    return ListView.builder(
      itemCount: _tasks.length,
      itemBuilder: (context, index) {
        final task = _tasks[index];
        return Dismissible(
          key: ValueKey(task),
          background: const ColoredBox(
            color: Colors.red,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Icon(Icons.delete, color: Colors.white),
              ),
            ),
          ),
          secondaryBackground: const ColoredBox(
            color: Colors.red,
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: Icon(Icons.delete, color: Colors.white),
              ),
            ),
          ),
          onDismissed: (_) =>_eliminarTask(index),
          child: ListTile(
            leading: const Icon(Icons.task_alt),
            title: Text(task),
          ),
        );
      },
    );
  }
}