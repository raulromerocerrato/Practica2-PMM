import 'package:flutter/material.dart';

class DismissibleList extends StatefulWidget {
  const DismissibleList({super.key});

  @override
  State<DismissibleList> createState() => _DismissibleListState();
}

class _DismissibleListState extends State<DismissibleList> {
  final List<String> _tasks = List.generate(10, (index) => 'Task ${index + 1}');
  final List<String> _realitzades = [];

  void _onDismissed(String task, DismissDirection direction) {
    final completada = direction == DismissDirection.startToEnd;
    setState(() {
      _tasks.remove(task);
      if (completada) _realitzades.add(task);
    });
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(completada ? '$task realitzada' : '$task eliminada'),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text('Pendents (${_tasks.length})', style: titleStyle),
          ),
        ),
        Expanded(
          child: _tasks.isEmpty
              ? const Center(child: Text('No hi ha tasques pendents'))
              : ListView.builder(
                  itemCount: _tasks.length,
                  itemBuilder: (context, index) {
                    final task = _tasks[index];
                    return Dismissible(
                      key: ValueKey(task),
                      background: const ColoredBox(
                        color: Colors.green,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 16),
                            child: Icon(Icons.check, color: Colors.white),
                          ),
                        ),
                      ),
                      secondaryBackground: const ColoredBox(
                        color: Colors.red,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 16),
                            child: Icon(Icons.delete, color: Colors.white),
                          ),
                        ),
                      ),
                      onDismissed: (direction) =>
                          _onDismissed(task, direction),
                      child: ListTile(
                        leading: const Icon(Icons.radio_button_unchecked),
                        title: Text(task),
                      ),
                    );
                  },
                ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text('Realitzades (${_realitzades.length})', style: titleStyle),
          ),
        ),
        Expanded(
          child: _realitzades.isEmpty
              ? const Center(child: Text('Cap tasca realitzada encara'))
              : ListView.builder(
                  itemCount: _realitzades.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading:
                          const Icon(Icons.check_circle, color: Colors.green),
                      title: Text(
                        _realitzades[index],
                        style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}