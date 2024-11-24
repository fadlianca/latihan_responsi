import 'package:flutter/material.dart';

import 'list_page.dart';

class HomePage extends StatelessWidget {
  final String username;
  final String password;

  const HomePage({super.key, required this.username, required this.password});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(),
        ),
        centerTitle: true,
        title: Text('Welcome, $username'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MenuButton(
              title: 'News',
              onPressed: () => _navigateToList(context, 'articles'),
            ),
            const SizedBox(height: 16),
            MenuButton(
              title: 'Blogs',
              onPressed: () => _navigateToList(context, 'blogs'),
            ),
            const SizedBox(height: 16),
            MenuButton(
              title: 'Reports',
              onPressed: () => _navigateToList(context, 'reports'),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToList(BuildContext context, String type) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ListPage(type: type),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const MenuButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}
