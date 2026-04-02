import 'package:flutter/material.dart';
import 'graph_registry.dart';
import 'content_renderer.dart';
import 'math_content_parser.dart';

class HeaderBlock extends StatelessWidget {
  final Map data;
  
  const HeaderBlock(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MathContentParser.buildHeader(
      data['title'],
      level: data['level'] ?? 1,
    );
  }
}

class TextBlock extends StatelessWidget {
  final Map data;
  const TextBlock(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var content = data['content'];
    if (content is String) return MathContentParser.buildBody(content);
    if (content is List) return ContentRenderer(content: content);
    return const SizedBox.shrink();
  }
}

class GraphBlock extends StatelessWidget {
  final Map data;
  
  const GraphBlock(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: GraphRegistry.getGraph(data['path'] ?? ''),
      ),
    );
  }
}

class ImageBlock extends StatelessWidget {
  final Map data;
  
  const ImageBlock(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Image.asset(
        data['path'],
        errorBuilder: (_, __, ___) => Container(
          height: 100,
          color: Colors.red[50],
          child: Center(child: Text("Image not found: ${data['path']}")),
        ),
      ),
    );
  }
}