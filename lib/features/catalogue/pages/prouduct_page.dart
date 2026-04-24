import 'package:shu/core/design_system/app_theme.dart';
import 'package:shu/core/widgets/app_shell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shu/features/catalogue/widgets/image_section.dart';
import 'package:shu/features/catalogue/providers/catalogue_provider.dart';

class ProuductPage extends ConsumerWidget {
  final int productId;

  const ProuductPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref
        .watch(catalogueProvider)
        .firstWhere((p) => p.id == productId);

    return AppShell(
      child: Center(
        child: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth > 700;

              if (isWide) {
                return Row(
                  children: [
                    SizedBox(
                      width: constraints.maxWidth * 0.55,
                      child: ImageSection(imageUrl: product.imageUrl),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(AppTheme.paddingLarge),
                        child: _ProductDetails(
                          category: product.category,
                          title: product.title,
                          price: product.price,
                          description: product.description,
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ImageSection(imageUrl: product.imageUrl),
                    Padding(
                      padding: const EdgeInsets.all(AppTheme.paddingMedium),
                      child: _ProductDetails(
                        category: product.category,
                        title: product.title,
                        price: product.price,
                        description: product.description,
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class _ProductDetails extends StatelessWidget {
  final String category;
  final String title;
  final double price;
  final String description;

  const _ProductDetails({
    required this.category,
    required this.title,
    required this.price,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          category.toUpperCase(),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 10,
            letterSpacing: 1.2,
            color: AppTheme.textPrimary.withValues(alpha: 0.6),
          ),
        ),
        const SizedBox(height: AppTheme.paddingSmall),
        Text(
          title.toUpperCase(),
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: AppTheme.paddingMedium),
        Text(
          '\$${price.toStringAsFixed(2)}',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: AppTheme.paddingMedium),
          child: Divider(color: AppTheme.textPrimary, thickness: 0.3),
        ),
        Text(
          description,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            height: 1.8,
            color: AppTheme.textPrimary.withValues(alpha: 0.7),
          ),
        ),
      ],
    );
  }
}
