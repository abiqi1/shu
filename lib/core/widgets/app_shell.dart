import 'package:shu/core/design_system/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// A page template that wraps any page with the shared nav bar.
/// Usage: return AppShell(child: YourPageContent());
class AppShell extends StatelessWidget {
  final Widget child;

  const AppShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Column(
        children: [
          const _NavBar(),
          Expanded(child: child),
        ],
      ),
    );
  }
}

class _NavBar extends StatelessWidget {
  const _NavBar();

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
          Image.asset(
            'assets/images/logo.png',
            height: 64,
            fit: BoxFit.contain,
          ),
          const Spacer(),
          _NavLink(label: 'CATALOGUE', onTap: () => context.go('/catalogue')),
          const SizedBox(width: AppTheme.paddingLarge),
          _NavLink(label: 'CART', onTap: () => context.go('/cart')),
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
