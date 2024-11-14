import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:git_repository/core/util/util.dart';
import 'package:git_repository/data/search_repository_list/search_repository_list.dart';
import 'dart:async';

class TextfieldSearch extends ConsumerStatefulWidget {
  const TextfieldSearch({super.key});

  @override
  ConsumerState<TextfieldSearch> createState() => _TextfieldSearchState();
}

class _TextfieldSearchState extends ConsumerState<TextfieldSearch> {
  late final TextEditingController _controller;
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: (value) {
        // 既存のタイマーをキャンセル
        _debounceTimer?.cancel();

        if (value.trim().isEmpty) {
          ref.read(searchRepositoryListProvider.notifier).clearRepository();
          return;
        }

        // 300ミリ秒後に検索を実行
        _debounceTimer = Timer(const Duration(milliseconds: 500), () {
          ref
              .read(searchRepositoryListProvider.notifier)
              .fetchRepository(value.trim(), 1);
        });
      },
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
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        // クリアボタンを追加
        suffixIcon: _controller.text.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  _controller.clear();
                  ref
                      .read(searchRepositoryListProvider.notifier)
                      .clearRepository();
                },
              )
            : null,
      ),
    );
  }
}
