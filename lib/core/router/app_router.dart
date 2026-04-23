import 'package:clothing_app/features/catalogue/pages/catelogue_page.dart';
import 'package:clothing_app/features/home/pages/home_page.dart';
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
      //   GoRoute(
      //     path: '/product/:id',
      //     builder: (context, state) {
      //       final id = int.parse(state.pathParameters['id']!);
      //       return ProductDetailPage(productId: id);
      //     },
      //   ),
      //   GoRoute(path: '/cart', builder: (context, state) => const CartPage()),
    ],
  );
}
