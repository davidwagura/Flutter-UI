import 'package:flutter/material.dart';
import '../widgets/navigation_bar.dart';
import '../widgets/project_card.dart';
import '../models/project_model.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ProjectModel> projects = [
      ProjectModel(
        title: 'School Website',
        description: 'A responsive school portal built with Vue.js & Laravel.',
        imageUrl: 'https://via.placeholder.com/400x200',
        link: 'https://github.com/yourgithub/school-website',
      ),
      ProjectModel(
        title: 'Chat App',
        description: 'Realtime chat with Flutter and Firebase.',
        imageUrl: 'https://via.placeholder.com/400x200',
        link: 'https://github.com/yourgithub/flutter-chat',
      ),
      ProjectModel(
        title: 'Portfolio App',
        description: 'This very app you’re browsing!',
        imageUrl: 'https://via.placeholder.com/400x200',
        link: 'https://github.com/yourgithub/portfolio',
      ),
    ];

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: NavigationBarWidget(),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          int columns = constraints.maxWidth < 600
              ? 1
              : (constraints.maxWidth < 1000 ? 2 : 3);
          return Padding(
            padding: const EdgeInsets.all(16),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columns,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.5,
              ),
              itemCount: projects.length,
              itemBuilder: (context, index) {
                return ProjectCard(project: projects[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
