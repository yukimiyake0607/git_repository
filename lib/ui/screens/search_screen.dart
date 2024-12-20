import 'package:flutter/material.dart';
import 'package:git_repository/core/result/result.dart';
import 'package:git_repository/data/search_repository_list/search_repository_list.dart';
import 'package:git_repository/models/repository_exception/repository_exception.dart';
import 'package:git_repository/models/searchRepository/search_repository.dart';
import 'package:git_repository/ui/widgets/result_empty.dart';
import 'package:git_repository/ui/widgets/result_success_screen.dart';
import 'package:git_repository/ui/widgets/textfield_search.dart';
import 'package:git_repository/core/util/util.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final ScrollController _scrollController = ScrollController();
  bool isLoading = false;
  bool isFetching = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _onScroll() async {
    if (isFetching) return;

    final position = _scrollController.position.pixels;
    final maxExtent = _scrollController.position.maxScrollExtent;

    if (position >= maxExtent - 20) {
      isFetching = true;

      try {
        await ref.read(searchRepositoryListProvider.notifier).loadMore();
      } finally {
        isFetching = false;
      }
    }
  }

  void _showDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('エラー'),
          content: const Text('予期せぬエラーが発生しました'),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final searchRepositoryAsync = ref.watch(searchRepositoryListProvider);

    // プロバイダを購読
    ref.listen<AsyncValue<Result<SearchRepository, RepositoryException>>>(
      searchRepositoryListProvider,
      (_, current) {
        current.whenOrNull(
          error: (error, stackTrace) {
            context.pop();
            _showDialog(context);
          },
          loading: () {
            if (!isLoading) {
              isLoading = true;
              showDialog<void>(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return Center(
                    child: CircularProgressIndicator(color: Colors.blue),
                  );
                },
              );
            }
          },
          data: (_) {
            if (isLoading == true) {
              context.pop();
              isLoading = false;
            }
          },
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'GitHub',
          style: titleTextstyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Expanded(child: TextfieldSearch()),
              ],
            ),
            Expanded(
              child: searchRepositoryAsync.when(
                data: (result) {
                  return result.when(
                    success: (searchRepository) {
                      return ResultSuccessScreen(
                        searchRepository,
                        _scrollController,
                      );
                    },
                    exception: (repositoryException) {
                      return Center(child: Text(repositoryException.message));
                    },
                  );
                },
                error: (_, __) => Center(child: Text('検索結果はありません')),
                loading: () {
                  final previousData = searchRepositoryAsync.valueOrNull;
                  if (previousData == null) {
                    return ResultEmptyScreen();
                  }

                  return previousData.when(
                    success: (searchRepository) {
                      return ResultSuccessScreen(
                        searchRepository,
                        _scrollController,
                      );
                    },
                    exception: (repositoryException) {
                      return Center(child: Text(repositoryException.message));
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
