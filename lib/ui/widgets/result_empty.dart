import 'package:flutter/material.dart';

class ResultEmptyScreen extends StatelessWidget {
  const ResultEmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/result_empty.png',
            width: 150,
            height: 150,
          ),
          const SizedBox(height: 30),
          Text('Repository Not Found',
              style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
