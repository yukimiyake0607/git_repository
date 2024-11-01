import 'package:flutter/material.dart';

class TextfieldSearch extends StatelessWidget {
  const TextfieldSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: TextEditingController(),
      decoration: InputDecoration(
        hintText: 'リポジトリを検索',
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
    );
  }
}
