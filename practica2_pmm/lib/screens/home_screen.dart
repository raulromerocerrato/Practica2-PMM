// StatefulWidget: esta pantalla guarda la Persona actual en su estado y debe
// reconstruirse (setState) cuando PersonalScreen devuelve los datos editados,
// para refrescar la tarjeta de perfil.

import 'package:flutter/material.dart';

import '../models/persona.dart';
import '../routes/app_routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Persona _persona = Persona.defaults();

    Future<void> _editProfile() async {
    final result = await Navigator.pushNamed(
      context,
      AppRoutes.personal,
      arguments: _persona,
    );
    if (!mounted || result == null) return;
    setState(() => _persona = result as Persona);
  }

  void _openShowcase() {
    Navigator.pushNamed(context, AppRoutes.widget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DevProfile M3')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text('Full name'),
                    subtitle: Text(_persona.fullName),
                  ),
                  ListTile(
                    leading: const Icon(Icons.email),
                    title: const Text('Email address'),
                    subtitle: Text(_persona.emailAddress),
                  ),
                  ListTile(
                    leading: const Icon(Icons.cake),
                    title: const Text('Date of birth'),
                    subtitle: Text(_persona.formatBirthDate),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: _editProfile,
              icon: const Icon(Icons.edit),
              label: const Text('Edita Perfil'),
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: _openShowcase,
              icon: const Icon(Icons.widgets),
              label: const Text('Explora Widgets'),
            ),
          ],
        ),
      ),
    );
  }
}