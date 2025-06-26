import 'package:flutter/material.dart';
import '../widgets/navigation_bar.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: NavigationBarWidget(),
      ),
      body: const Center(child: Text('Contact Page')),
    );
  }
}
