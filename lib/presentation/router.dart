import 'package:git_repository/ui/screens/detail_screen.dart';
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
      builder: (context, state) => DetailScreen(),
    ),
  ],
);
