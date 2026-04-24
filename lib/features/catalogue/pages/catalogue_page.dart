import 'package:shu/core/design_system/app_theme.dart';
import 'package:shu/core/widgets/app_shell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shu/features/catalogue/providers/selected_category_provider.dart';
import 'package:shu/features/catalogue/providers/catalogue_provider.dart';
import 'package:shu/features/catalogue/widgets/product_card.dart';
import 'package:go_router/go_router.dart';

class CataloguePage extends ConsumerWidget {
  const CataloguePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(selectedCategoryProvider);

    return AppShell(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppTheme.paddingLarge,
                vertical: AppTheme.paddingLarge,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _FilterTab(
                      label: 'all',
                      isSelected: selectedCategory == 'all',
                      onTap: () => ref
                          .read(selectedCategoryProvider.notifier)
                          .select('all'),
                    ),
                    const SizedBox(width: AppTheme.paddingLarge),
                    _FilterTab(
                      label: 'abayas',
                      isSelected: selectedCategory == 'abayas',
                      onTap: () => ref
                          .read(selectedCategoryProvider.notifier)
                          .select('abayas'),
                    ),
                    const SizedBox(width: AppTheme.paddingLarge),
                    _FilterTab(
                      label: 'gowns',
                      isSelected: selectedCategory == 'gowns',
                      onTap: () => ref
                          .read(selectedCategoryProvider.notifier)
                          .select('gowns'),
                    ),
                    const SizedBox(width: AppTheme.paddingLarge),
                    _FilterTab(
                      label: 'occasionwear',
                      isSelected: selectedCategory == 'occasionwear',
                      onTap: () => ref
                          .read(selectedCategoryProvider.notifier)
                          .select('occasionwear'),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppTheme.paddingLarge,
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final width = constraints.maxWidth;
                    final columns = width > 900
                        ? 3
                        : width > 600
                        ? 2
                        : 1;
                    final allProducts = ref.watch(catalogueProvider);
                    final filteredProducts = selectedCategory == 'all'
                        ? allProducts
                        : allProducts
                              .where((p) => p.category == selectedCategory)
                              .toList();

                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: columns,
                        crossAxisSpacing: AppTheme.paddingMedium,
                        mainAxisSpacing: AppTheme.paddingMedium,
                        childAspectRatio: 0.50,
                      ),
                      itemCount: filteredProducts.length,
                      itemBuilder: (context, index) {
                        final product = filteredProducts[index];
                        return GestureDetector(
                          onTap: () => context.go('/product/${product.id}'),
                          child: ProductCard(
                            imageUrl: product.imageUrl,
                            title: product.title,
                            category: product.category,
                            price: product.price,
                            onAddToCart: () {},
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterTab extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _FilterTab({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(bottom: 1),
        decoration: BoxDecoration(
          border: Border(
            bottom: isSelected
                ? BorderSide(color: AppTheme.textPrimary, width: 1)
                : BorderSide.none,
          ),
        ),
        child: Text(
          label.toUpperCase(),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: isSelected
                ? AppTheme.textPrimary
                : AppTheme.textPrimary.withValues(alpha: 0.6),
          ),
        ),
      ),
    );
  }
}
