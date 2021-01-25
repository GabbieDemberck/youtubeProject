import 'package:flutter/material.dart';

class Choice {
  final String label;
  final IconData icon;
  const Choice({this.label, this.icon});
}

const List<Choice> choices = const <Choice>[
  const Choice(icon: Icons.home, label: 'Home'),
  const Choice(icon: Icons.explore_outlined, label: 'Explore'),
  const Choice(icon: Icons.add_circle_outline, label: ''),
  const Choice(icon: Icons.ondemand_video_outlined, label: 'Inscrições'),
  const Choice(icon: Icons.video_library_outlined, label: 'Biblioteca')
];
