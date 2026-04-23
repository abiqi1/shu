import 'package:clothing_app/core/design_system/app_theme.dart';
import 'package:clothing_app/core/widgets/app_shell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clothing_app/features/catalogue/providers/selected_category_provider.dart';
import 'package:clothing_app/features/catalogue/providers/catalogue_provider.dart';
import 'package:clothing_app/core/widgets/product_card.dart';

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
                      label: 'ALL',
                      isSelected: selectedCategory == 'ALL',
                      onTap: () => ref
                          .read(selectedCategoryProvider.notifier)
                          .select('ALL'),
                    ),
                    const SizedBox(width: AppTheme.paddingLarge),
                    _FilterTab(
                      label: 'ABAYAS',
                      isSelected: selectedCategory == 'ABAYAS',
                      onTap: () => ref
                          .read(selectedCategoryProvider.notifier)
                          .select('ABAYAS'),
                    ),
                    const SizedBox(width: AppTheme.paddingLarge),
                    _FilterTab(
                      label: 'GOWNS',
                      isSelected: selectedCategory == 'GOWNS',
                      onTap: () => ref
                          .read(selectedCategoryProvider.notifier)
                          .select('GOWNS'),
                    ),
                    const SizedBox(width: AppTheme.paddingLarge),
                    _FilterTab(
                      label: 'OCCASIONWEAR',
                      isSelected: selectedCategory == 'OCCASIONWEAR',
                      onTap: () => ref
                          .read(selectedCategoryProvider.notifier)
                          .select('OCCASIONWEAR'),
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
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: columns,
                        crossAxisSpacing: AppTheme.paddingMedium,
                        mainAxisSpacing: AppTheme.paddingMedium,
                        childAspectRatio: 0.50,
                      ),
                      itemCount: ref.watch(catalogueProvider).length,
                      itemBuilder: (context, index) {
                        final product = ref.watch(catalogueProvider)[index];
                        return ProductCard(
                          imageUrl: product.imageUrl,
                          title: product.title,
                          category: product.category,
                          price: product.price,
                          onAddToCart: () {},
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
          label,
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
