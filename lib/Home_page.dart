import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/bloc'),
              child: const Text(
                'BLoC',
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
            ),
            const SizedBox(width: 20,),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/statefull'),
              child: const Text(
                'Statefull',
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}