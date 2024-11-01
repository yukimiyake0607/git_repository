import 'package:flutter/material.dart';

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
            child: TextField(
              controller: TextEditingController(),
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Color(0xFFE1EEDF),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(30),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(30),
                ),
                prefixIcon: Icon(Icons.search),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 0,
                  vertical: 8.0,
                ),
              ),
            ),
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
