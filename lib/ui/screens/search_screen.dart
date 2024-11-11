import 'package:flutter/material.dart';
import 'package:git_repository/data/search_repository_list/search_repository_list.dart';
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
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: Colors.black54,
                      size: 28,
                    )),
              ],
            ),
            Divider(color: dividerColor),
            searchRepositoryAsync.when(
              data: (result) {
                return result.when(success: (searchRepository) {
                  return Text('${searchRepository.totalCount}件');
                }, exception: (repositoryException) {
                  return Text('--');
                });
              },
              error: (_, __) => const SizedBox.shrink(),
              loading: () => const SizedBox.shrink(),
            ),
            Expanded(
              child: searchRepositoryAsync.when(
                data: (result) {
                  return result.when(
                    success: (searchRepository) {
                      return searchRepository.totalCount == 0
                          ? Center(
                              child: Text('検索結果はありません'),
                            )
                          : ListView.builder(
                              itemCount: searchRepository.totalCount,
                              itemBuilder: (BuildContext context, int index) {
                                final repo = searchRepository.items[index];
                                return Column(
                                  children: [
                                    ListTile(
                                      leading: CircleAvatar(
                                        backgroundImage:
                                            NetworkImage(repo.avatarUrl),
                                      ),
                                      title: Text(
                                        repo.name,
                                        style: repositoryTitleTextStyle,
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(repo.description),
                                          SizedBox(height: 5),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.language,
                                                color: Colors.blue,
                                              ),
                                              Text(repo.language),
                                              SizedBox(width: 10),
                                              Icon(
                                                Icons.stars_rounded,
                                                color: Colors.lightGreen,
                                              ),
                                              Text(repo.stargazersCount
                                                  .toString()),
                                            ],
                                          ),
                                        ],
                                      ),
                                      trailing: Icon(Icons.chevron_right),
                                      onTap: () {
                                        context.push('/detail');
                                      },
                                    ),
                                    Divider(color: dividerColor),
                                  ],
                                );
                              },
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
