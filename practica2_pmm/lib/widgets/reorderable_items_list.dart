import 'package:flutter/material.dart';

class ReorderableItemsList extends StatefulWidget {
  const ReorderableItemsList({super.key});

  @override
  State<ReorderableItemsList> createState() => _ReorderableItemsListState();
}

class _ReorderableItemsListState extends State<ReorderableItemsList> {
  final List<String> _skills = ['Flutter', 'Dart', 'Git', 'Java', 'HTML'];

  void _reordenar(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) newIndex-= 1;
      final skill = _skills.removeAt(oldIndex);
      _skills.insert(newIndex, skill);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ReorderableListView.builder(
      itemCount: _skills.length,
      onReorder: _reordenar,
      itemBuilder: (context, index) {
        final skill = _skills[index];
        return ListTile(
          key: ValueKey(skill),
          leading: const Icon(Icons.drag_handle),
          title: Text(skill),
        );
      },
    );
  }
}