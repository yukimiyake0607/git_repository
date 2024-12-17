import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:git_repository/core/util/util.dart';
import 'package:git_repository/models/searchRepository/search_repository.dart';
import 'package:git_repository/ui/widgets/result_empty.dart';
import 'package:go_router/go_router.dart';

class ResultSuccessScreen extends ConsumerWidget {
  final SearchRepository _searchRepository;
  final ScrollController _scrollController;

  const ResultSuccessScreen(
    this._searchRepository,
    this._scrollController, {
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Divider(color: dividerColor),
              Text('${_searchRepository.totalCount}件'),
            ],
          ),
        ),
        _searchRepository.items.isEmpty
            ? SliverFillRemaining(child: ResultEmptyScreen())
            : SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final repo = _searchRepository.items[index];
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                repo.owner?.avatarUrl?.isEmpty == false
                                    ? NetworkImage(repo.owner!.avatarUrl!)
                                    : null, // テスト用に空の場合はnullを使用
                            backgroundColor: repo.owner?.avatarUrl != null
                                ? Colors.white
                                : Colors.grey,
                            child: repo.owner?.avatarUrl?.isEmpty == true
                                ? const Icon(Icons.person) // 画像がない場合のフォールバック
                                : null,
                          ),
                          title: Text(
                            repo.name!,
                            style: repositoryTitleTextStyle,
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(repo.description ?? ''),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.language,
                                    color: Colors.blue,
                                  ),
                                  Text(repo.language ?? '-'),
                                  const SizedBox(width: 10),
                                  const Icon(
                                    Icons.stars_rounded,
                                    color: Colors.lightGreen,
                                  ),
                                  Text(repo.stargazersCount.toString()),
                                ],
                              ),
                            ],
                          ),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {
                            context.push(
                              '/detail',
                              extra: repo,
                            );
                          },
                        ),
                        Divider(color: dividerColor),
                      ],
                    );
                  },
                  childCount: _searchRepository.items.length,
                ),
              ),
      ],
    );
  }
}
