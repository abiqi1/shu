import 'package:flutter/material.dart';
import 'package:shu/core/design_system/app_theme.dart';

class ImageSection extends StatelessWidget {
  final String imageUrl;

  const ImageSection({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppTheme.paddingLarge),
      child: AspectRatio(
        aspectRatio: 2 / 3,
        child: Container(
          color: AppTheme.background,
          width: double.infinity,
          // Todo: In production, use cached_network_image package here
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            // Graceful error handling for broken web images
            errorBuilder: (context, error, stackTrace) => const Icon(
              Icons.image_not_supported,
              color: AppTheme.textPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
