import 'package:clothing_app/core/design_system/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Column(
        children: [
          _NavBar(),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppTheme.paddingLarge,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      height: 240,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: AppTheme.paddingLarge),
                    Text(
                      'Welcome to Shu',
                      style: Theme.of(context).textTheme.displayLarge,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppTheme.paddingLarge),
                    ElevatedButton(
                      onPressed: () => context.go('/catalogue'),
                      child: const Text('Shop Now'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Todo: move to separate file
class _NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.paddingLarge,
        vertical: AppTheme.paddingMedium,
      ),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppTheme.secondary)),
      ),
      child: Row(
        children: [
          // Brand name
          Image.asset(
            'assets/images/logo.png',
            height: 64, // control the size here
            fit: BoxFit.contain,
          ),
          const Spacer(),
          // Nav links
          _NavLink(label: 'Catalogue', onTap: () => context.go('/catalogue')),
          const SizedBox(width: AppTheme.paddingLarge),
          _NavLink(label: 'Cart', onTap: () => context.go('/cart')),
        ],
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _NavLink({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        label,
        style: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(letterSpacing: 1),
      ),
    );
  }
}
