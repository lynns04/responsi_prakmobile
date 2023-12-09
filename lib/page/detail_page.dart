import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  final String id;
  final String name;
  final String categories;
  final String youtubeUrl;

  const DetailPage({
    super.key,
    required this.id,
    required this.name,
    required this.categories,
    required this.youtubeUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('${id.toUpperCase()} DETAIL'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        children: [
          const SizedBox(height: 10),
          Text(
            name,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 10),
          Text(categories),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await launchUrl(Uri.parse(youtubeUrl));
        },
        label: const Text('See More..'),
        icon: const Icon(Icons.travel_explore),
      ),
    );
  }
}
