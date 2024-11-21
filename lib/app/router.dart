import 'package:git_repository/models/repository_item/repository_item.dart';
import 'package:git_repository/ui/screens/repository_detail_screen.dart';
import 'package:git_repository/ui/screens/search_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'initial',
      builder: (context, state) => SearchScreen(),
    ),
    GoRoute(
      path: '/detail',
      name: 'detail',
      builder: (context, state) {
        final RepositoryItem repository = GoRouterState.of(context).extra as RepositoryItem;
        return RepositoryDetailScreen(repository);
      },
    ),
  ],
);
