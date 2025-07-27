import 'package:flutter/material.dart';

import 'screens/bottom_nav.dart';

void main() => runApp(const MaterialApp(home: BottomNav()));

class _HomePage extends StatefulWidget {
  const _HomePage();

  @override
  State<_HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<_HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.person), onPressed: () => _scaffoldKey.currentState?.openDrawer()),
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: CloseButton(onPressed: () => _scaffoldKey.currentState?.closeDrawer()),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      Center(child: const Icon(Icons.person, size: 64)),
                      const SizedBox(height: 8),
                      Text('My Name', style: Theme.of(context).textTheme.bodyLarge),
                      const SizedBox(height: 32),
                      for (int i = 0; i < 20; i++) ListTile(title: Text('Item $i')),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
