import 'package:flutter/material.dart';
import '../widgets/navigation_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: NavigationBarWidget(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Hi, I’m David Wanjohi 👋',
              style: TextStyle(fontSize: 28),
            ),
            const Text(
              'Frontend & Backend Developer',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            const Text(
              'Welcome to my portfolio! Explore my projects and learn more about me.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 20), // Add spacing
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/projects');
              },
              child: const Text("See My Projects"),
            ),
          ],
        ),
      ),
    );
  }
}
