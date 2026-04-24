import 'package:shu/core/design_system/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:shu/features/catalogue/widgets/image_section.dart';

class ProductCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String category;
  final double price;
  final VoidCallback onAddToCart;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.category,
    required this.price,
    required this.onAddToCart,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedScale(
            scale: _hovered ? 1.03 : 1.0,
            duration: const Duration(milliseconds: 200),
            child: ImageSection(imageUrl: widget.imageUrl),
          ),
          _ProductDetails(widget: widget),
        ],
      ),
    );
  }
}

class _ProductDetails extends StatelessWidget {
  const _ProductDetails({required this.widget});

  final ProductCard widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppTheme.paddingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.category.toUpperCase(),
            // Todo: add textStyle for category in theme
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontSize: 10, letterSpacing: 1.2),
          ),
          const SizedBox(height: AppTheme.paddingSmall / 2),
          Text(
            widget.title,
            //Todo: add textStyle for title in theme
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: AppTheme.paddingSmall),
          Text(
            // Simple formatting; use the intl package for currency
            '\$${widget.price.toStringAsFixed(2)}',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
