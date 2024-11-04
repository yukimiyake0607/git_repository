import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RepositoryDetailScreen extends StatelessWidget {
  const RepositoryDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('リポジトリ詳細'),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(
            Icons.chevron_left,
          ),
        ),
      ),
    );
  }
}
