import 'package:shu/core/design_system/app_theme.dart';
import 'package:shu/core/widgets/app_shell.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShell(
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
                child: const Text('SHOP NOW'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
