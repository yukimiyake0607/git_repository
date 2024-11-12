import 'package:flutter/material.dart';
import 'package:git_repository/data/provider/search_repository_list.dart';
import 'package:git_repository/ui/widgets/textfield_search.dart';
import 'package:git_repository/core/util/util.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  static const _titleTextstyle = TextStyle(fontSize: 30);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchRepositoryAsync = ref.watch(searchRepositoryListProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'GitHub',
          style: _titleTextstyle,
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
                IconButton(
                  onPressed: () {
                    ref
                        .read(searchRepositoryListProvider.notifier)
                        .fetchRepository('flutter', 1);
                  },
                  icon: Icon(
                    Icons.search,
                    color: Colors.black54,
                    size: 28,
                  ),
                ),
              ],
            ),
            Expanded(
              child: searchRepositoryAsync.when(
                data: (result) {
                  return result.when(
                    success: (searchRepository) {
                      return CustomScrollView(
                        slivers: [
                          SliverToBoxAdapter(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Divider(color: dividerColor),
                                Text('${searchRepository.items.length}件'),
                              ],
                            ),
                          ),
                          searchRepository.totalCount == 0
                              ? SliverFillRemaining(
                                  child: Center(
                                    child: Text('検索結果はありません'),
                                  ),
                                )
                              : SliverList(
                                  delegate: SliverChildBuilderDelegate(
                                    (context, index) {
                                      final repo =
                                          searchRepository.items[index];
                                      return Column(
                                        children: [
                                          ListTile(
                                            leading: CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                repo.avatarUrl ??
                                                    'https://github.com/identicons/default.png',
                                              ),
                                            ),
                                            title: Text(
                                              repo.name!,
                                              style: repositoryTitleTextStyle,
                                            ),
                                            subtitle: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
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
                                                    Text(repo.stargazersCount
                                                        .toString()),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            trailing:
                                                const Icon(Icons.chevron_right),
                                            onTap: () {
                                              context.push('/detail');
                                            },
                                          ),
                                          Divider(color: dividerColor),
                                        ],
                                      );
                                    },
                                    childCount: searchRepository.items.length,
                                  ),
                                ),
                        ],
                      );
                    },
                    exception: (repositoryException) {
                      return Text(repositoryException.message);
                    },
                  );
                },
                error: (error, stackTrace) => CircularProgressIndicator(),
                loading: () => CircularProgressIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
