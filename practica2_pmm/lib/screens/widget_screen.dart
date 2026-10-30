// StatelessWidget: esta pantalla no guarda datos que cambien. Solo organiza
// las dos pestañas; el estado de cada lista (borrar y reordenar elementos)
// vive en sus propios StatefulWidget dentro de widgets/.

import 'package:flutter/material.dart';

import '../widgets/dismissible_list.dart';

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
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            DismissibleList(),
          ],
        ),
      ),
    );
  }
}