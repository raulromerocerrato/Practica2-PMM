// StatelessWidget: aquesta pantalla no guarda dades que canviïn. Només organitza
// les dues pestanyes; l'estat de cada llista (esborrar i reordenar elements)
// viu als seus propis StatefulWidget dins de widgets/.

import 'package:flutter/material.dart';

import '../widgets/dismissible_list.dart';
import '../widgets/reorderable_items_list.dart';

class WidgetPage extends StatelessWidget {
  const WidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dismissible i Reorderable'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.swipe), text: 'Dismissible'),
              Tab(icon: Icon(Icons.reorder), text: 'Reorderable'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            DismissibleList(),
            ReorderableItemsList(),
          ],
        ),
      ),
    );
  }
}