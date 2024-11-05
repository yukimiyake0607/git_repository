import 'package:flutter/material.dart';
import 'package:git_repository/models/detailRepository/detail_repository.dart';
import 'package:git_repository/ui/widgets/detail_repository_item.dart';
import 'package:git_repository/util/util.dart';
import 'package:go_router/go_router.dart';

class RepositoryDetailScreen extends StatelessWidget {
  RepositoryDetailScreen({super.key});

  final detailRepo = DetailRepository(
    name: 'flutter',
    avatarUrl:
        'https://secure.gravatar.com/avatar/e7956084e75f239de85d3a31bc172ace?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png',
    description: '仮の説明欄です。Riverpod導入後削除します。',
    language: 'Dart',
    stargazersCount: 1,
    watchersCount: 3,
    forksCount: 0,
    openIssuesCount: 1,
  );

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
                  backgroundImage: NetworkImage(detailRepo.avatarUrl),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  detailRepo.name,
                  style: repositoryTitleTextStyle,
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(detailRepo.description),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Divider(color: dividerColor),
            ),
            DetailRepositoryItem(
              avatarColor: Colors.blue,
              avatarIcon: Icons.language,
              itemName: '言語',
              itemDetail: detailRepo.language,
            ),
            SizedBox(height: 10),
            DetailRepositoryItem(
              avatarColor: Colors.lightGreen,
              avatarIcon: Icons.star,
              itemName: 'star',
              itemDetail: detailRepo.stargazersCount.toString(),
            ),
            SizedBox(height: 10),
            DetailRepositoryItem(
              avatarColor: Colors.orangeAccent,
              avatarIcon: Icons.remove_red_eye,
              itemName: 'watch',
              itemDetail: detailRepo.watchersCount.toString(),
            ),
            SizedBox(height: 10),
            DetailRepositoryItem(
              avatarColor: Colors.deepPurple,
              avatarIcon: Icons.fork_right,
              itemName: 'fork',
              itemDetail: detailRepo.forksCount.toString(),
            ),
            SizedBox(height: 10),
            DetailRepositoryItem(
              avatarColor: Colors.green,
              avatarIcon: Icons.info_outline,
              itemName: 'issue',
              itemDetail: detailRepo.openIssuesCount.toString(),
            ),
          ],
        ),
      ),
    );
  }
}


