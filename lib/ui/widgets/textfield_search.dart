import 'package:flutter/material.dart';
import 'package:git_repository/core/util/util.dart';

class TextfieldSearch extends StatelessWidget {
  const TextfieldSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: TextEditingController(),
      decoration: InputDecoration(
          hintText: 'リポジトリを検索',
          border: InputBorder.none,
          fillColor: searchItemColor,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(30),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
    );
  }
}
