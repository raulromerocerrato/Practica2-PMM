// StatefulWidget: aquesta pantalla necessita estat mutable per gestionar els
// TextEditingController, la data de naixement triada amb el DatePicker i
// la validació del formulari. Els controladors s'alliberen en disposa().

import 'package:flutter/material.dart';

import '../models/persona.dart';

class PersonalPage extends StatefulWidget {
  const PersonalPage({super.key});

  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _birthDateController = TextEditingController();

  late DateTime _birthDate;
  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initialized) return;
    _initialized = true;

    final persona = ModalRoute.of(context)!.settings.arguments as Persona;
    _birthDate = persona.dateOfBirth;
    _firstNameController.text = persona.firstName;
    _lastNameController.text = persona.lastName;
    _emailController.text = persona.emailAddress;
    _passwordController.text = persona.password;
    _birthDateController.text = persona.formatBirthDate;
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _birthDateController.dispose();
    super.dispose();
  }

  String _formatDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    return '$day/$month/${date.year}';
  }

  Future<void> _seleccionaDate() async {
    final seleccionada = await showDatePicker(
      context: context,
      initialDate: _birthDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (seleccionada == null) return;
    setState(() {
      _birthDate = seleccionada;
      _birthDateController.text = _formatDate(seleccionada);
    });
  }

  String? _required(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  void _saveAndReturn() {
    if (!_formKey.currentState!.validate()) return;

    final updatedPersona = Persona(
      firstName: _firstNameController.text.trim(),
      lastName: _lastNameController.text.trim(),
      emailAddress: _emailController.text.trim(),
      password: _passwordController.text,
      dateOfBirth: _birthDate,
    );

    Navigator.pop(context, updatedPersona);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Romero - Edit Profile')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _firstNameController,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  labelText: 'Nom',
                  border: OutlineInputBorder(),
                ),
                validator: _required,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _lastNameController,
                decoration: const InputDecoration(
                  labelText: 'Cognom',
                  border: OutlineInputBorder(),
                ),
                validator: _required,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Addreça de correu',
                  border: OutlineInputBorder(),
                ),
                validator: _required,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Contrassenya',
                  border: OutlineInputBorder(),
                ),
                validator: _required,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _birthDateController,
                readOnly: true,
                onTap: _seleccionaDate,
                decoration: const InputDecoration(
                  labelText: 'Data de naixement',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                validator: _required,
              ),
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: _saveAndReturn,
                icon: const Icon(Icons.save),
                label: const Text('Guardar i tornar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}