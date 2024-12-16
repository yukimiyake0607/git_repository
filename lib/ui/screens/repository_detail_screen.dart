import 'package:flutter/material.dart';
import 'package:git_repository/models/repository_item/repository_item.dart';
import 'package:git_repository/ui/widgets/detail_repository_item.dart';
import 'package:git_repository/core/util/util.dart';
import 'package:go_router/go_router.dart';

class RepositoryDetailScreen extends StatelessWidget {
  const RepositoryDetailScreen(this._repositoryItem, {super.key});

  final RepositoryItem _repositoryItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('リポジトリ詳細'),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(
            Icons.chevron_left,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.grey,
                  backgroundImage: _repositoryItem.owner?.avatarUrl != null
                      ? NetworkImage(_repositoryItem.owner!.avatarUrl!)
                      : null,
                  child: _repositoryItem.owner?.avatarUrl == null
                      ? const Icon(Icons.person)
                      : null,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  _repositoryItem.name ?? '--',
                  style: repositoryTitleTextStyle,
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(_repositoryItem.description ?? ''),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Divider(color: dividerColor),
            ),
            DetailRepositoryItem(
              avatarColor: Colors.blue,
              avatarIcon: Icons.language,
              itemName: '言語',
              itemDetail: _repositoryItem.language ?? '--',
            ),
            SizedBox(height: 10),
            DetailRepositoryItem(
              avatarColor: Colors.lightGreen,
              avatarIcon: Icons.star,
              itemName: 'star',
              itemDetail: _repositoryItem.stargazersCount.toString(),
            ),
            SizedBox(height: 10),
            DetailRepositoryItem(
              avatarColor: Colors.orangeAccent,
              avatarIcon: Icons.remove_red_eye,
              itemName: 'watch',
              itemDetail: _repositoryItem.watchersCount.toString(),
            ),
            SizedBox(height: 10),
            DetailRepositoryItem(
              avatarColor: Colors.deepPurple,
              avatarIcon: Icons.fork_right,
              itemName: 'fork',
              itemDetail: _repositoryItem.forksCount.toString(),
            ),
            SizedBox(height: 10),
            DetailRepositoryItem(
              avatarColor: Colors.green,
              avatarIcon: Icons.info_outline,
              itemName: 'issue',
              itemDetail: _repositoryItem.openIssuesCount.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
