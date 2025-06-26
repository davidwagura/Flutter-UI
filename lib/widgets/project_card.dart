import 'package:flutter/material.dart';
import '../models/project_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatefulWidget {
  final ProjectModel project;

  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHovered = false;

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) throw 'Could not launch $url';
  }

  Matrix4 _getTransform() {
    final matrix = Matrix4.identity();
    if (isHovered) {
      matrix.scale(1.05);
    }
    return matrix;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: _getTransform(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            if (isHovered)
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
          ],
          color: Colors.white,
        ),
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.network(
              widget.project.imageUrl,
              height: 120,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 12),
            Text(
              widget.project.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(widget.project.description, textAlign: TextAlign.center),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => _launchURL(widget.project.link),
              child: const Text('View Project'),
            ),
          ],
        ),
      ),
    );
  }
}
