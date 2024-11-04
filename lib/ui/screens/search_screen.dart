import 'package:flutter/material.dart';
import 'package:git_repository/models/searchRepository/search_repository.dart';
import 'package:git_repository/ui/widgets/textfield_search.dart';
import 'package:go_router/go_router.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  static const _titleTextstyle = TextStyle(fontSize: 30);

  final List<SearchRepository> searchRepositories = [
    SearchRepository(
        name: 'flutter',
        avatarUrl:
            'https://secure.gravatar.com/avatar/e7956084e75f239de85d3a31bc172ace?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png',
        language: 'Dart',
        description: 'とりあえずのクラスです。ここはリポジトリ説明欄です。とりあえずのクラスです。ここはリポジトリ説明欄です。',
        stargazersCount: 10),
    SearchRepository(
        name: 'flutter',
        avatarUrl:
            'https://secure.gravatar.com/avatar/e7956084e75f239de85d3a31bc172ace?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png',
        language: 'Dart',
        description: 'とりあえずのクラス',
        stargazersCount: 10),
    SearchRepository(
        name: 'flutter',
        avatarUrl:
            'https://secure.gravatar.com/avatar/e7956084e75f239de85d3a31bc172ace?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png',
        language: 'Dart',
        description: 'とりあえずのクラス',
        stargazersCount: 10),
  ];

  @override
  Widget build(BuildContext context) {
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
            TextfieldSearch(),
            Divider(color: const Color.fromARGB(255, 228, 226, 226)),
            Text('Total ******'),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  final repo = searchRepositories[index];
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(repo.avatarUrl),
                        ),
                        title: Text(
                          repo.name,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 20),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                Text(repo.stargazersCount.toString()),
                              ],
                            ),
                          ],
                        ),
                        trailing: Icon(Icons.chevron_right),
                        onTap: () {
                          context.push('/detail');
                        },
                      ),
                      Divider(color: const Color.fromARGB(255, 228, 226, 226)),
                    ],
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
