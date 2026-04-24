import 'package:shu/features/catalogue/pages/catalogue_page.dart';
import 'package:shu/features/catalogue/pages/prouduct_page.dart';
import 'package:shu/features/home/pages/home_page.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomePage()),
      GoRoute(
        path: '/catalogue',
        builder: (context, state) => const CataloguePage(),
      ),
      GoRoute(
        path: '/product/:id',
        builder: (context, state) {
          final id = int.tryParse(state.pathParameters['id'] ?? '') ?? 0;
          return ProuductPage(productId: id);
        },
      ),
      //   GoRoute(path: '/cart', builder: (context, state) => const CartPage()),
    ],
  );
}
