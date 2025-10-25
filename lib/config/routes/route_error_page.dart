import 'package:cifarx_task/core/utils/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorPage extends StatelessWidget {
  final GoRouterState? state;

  const ErrorPage({super.key, this.state});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final errorMessage = state?.error?.message ?? 'The page you’re looking for doesn’t exist.';
    final failedPath = state?.uri.toString() ?? '';

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        title: const Text("404 - Page Not Found",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        elevation: 2,
        backgroundColor: AppColors.blueLight,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Material(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Animated error icon
                  TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0.8, end: 1),
                    duration: const Duration(milliseconds: 700),
                    curve: Curves.elasticOut,
                    builder: (context, scale, _) => Transform.scale(
                      scale: scale,
                      child: const Icon(Icons.error_outline, size: 80, color: Colors.red),
                    ),
                  ),

                  const SizedBox(height: 24),
                  Text(
                    "Oops! Page Not Found",
                    style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),

                  Text(
                    errorMessage,
                    style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.7)),
                    textAlign: TextAlign.center,
                  ),

                  if (failedPath.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(
                      'Route: $failedPath',
                      style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ],

                  const SizedBox(height: 32),
                  SizedBox(
                    width: 160,
                    height: 48,
                    child: ElevatedButton.icon(
                      onPressed: () => context.go('/'),
                      icon: const Icon(Icons.home, color: Colors.white),
                      label: const Text("Back to Home",style: TextStyle(color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
