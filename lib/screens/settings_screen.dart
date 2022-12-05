import 'package:flutter/material.dart';
import 'package:receitas_refeicoes/components/main_drawer.dart';
import 'package:receitas_refeicoes/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var settings = Settings();

  Widget createSwitch(
    String title,
    String subtitle,
    bool value,
    onChanged,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              createSwitch(
                'Sem Glutén',
                'Só exibe refeições sem glutén!',
                settings.isGlutenFree,
                (value) => setState(() => settings.isGlutenFree = value),
              ),
              createSwitch(
                'Sem Lactose',
                'Só exibe refeições sem lactose!',
                settings.isLactoseFree,
                (value) => setState(() => settings.isLactoseFree = value),
              ),
              createSwitch(
                'Vegana',
                'Só exibe refeições veganas!',
                settings.isVegan,
                (value) => setState(() => settings.isVegan = value),
              ),
              createSwitch(
                'Vegetariana',
                'Só exibe refeições vegetarianas!',
                settings.isVegetarian,
                (value) => setState(() => settings.isVegetarian = value),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
