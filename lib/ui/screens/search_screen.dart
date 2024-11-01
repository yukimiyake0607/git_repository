import 'package:flutter/material.dart';
import 'package:git_repository/ui/widgets/textfield_search.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFDF6),
      appBar: AppBar(
        title: Text(
          'GitHub',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
            child: TextfieldSearch(),
          ),
          Divider(color: const Color.fromARGB(255, 228, 226, 226)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text('Total ******'),
          ),
        ],
      ),
    );
  }
}
