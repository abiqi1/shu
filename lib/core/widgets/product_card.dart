import 'package:shu/core/design_system/app_theme.dart';
import 'package:shu/core/widgets/store_button.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    // We use a Container instead of a Card for a cleaner, modern, flat aesthetic
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 2 / 3, // Creates a perfect square
          child: Container(
            color: AppTheme.background,
            width: double.infinity,
            // In production, use cached_network_image package here
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              // Graceful error handling for broken web images
              errorBuilder: (context, error, stackTrace) => const Icon(
                Icons.image_not_supported,
                color: AppTheme.secondary,
              ),
            ),
          ),
        ),

        // 2. The Text Details
        Padding(
          padding: const EdgeInsets.all(AppTheme.paddingMedium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category.toUpperCase(),
                //Todo: add textStyle for category in theme
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 10,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: AppTheme.paddingSmall / 2),
              Text(
                title,
                //Todo: add textStyle for title in theme
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: AppTheme.paddingSmall),
              Text(
                // Simple formatting; in a real app, use the intl package for currency
                '\$${price.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
