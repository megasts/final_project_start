import 'package:flutter/material.dart';

import 'drawer.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('О приложении'), actions: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/homePage');
            },
            icon: const Icon(Icons.account_box)),
        TextButton(
            onPressed: () {
              if (!ModalRoute.of(context)!.isFirst) {
                Navigator.pop(context);
              }
            },
            child: const Text(
              'Назад',
              style: TextStyle(color: Colors.black),
            ))
      ]),
      drawer: const BuildDrawer(),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 180),
            SizedBox(
              width: 180,
              child: Image.asset('assets/flutter.png'),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: 180,
              child: Text(
                'TODO на Flutter\nВерсия: итоговая',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
