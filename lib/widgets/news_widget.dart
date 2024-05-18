import 'package:flutter/material.dart';

class NewsWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String publishDate;
  final String author;
  final String link;

  const NewsWidget({super.key,
    required this.title,
    required this.subtitle,
    required this.publishDate,
    required this.author,
    required this.link});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
