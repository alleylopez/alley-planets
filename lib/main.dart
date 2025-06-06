import 'package:alley_planets/core/theme/AppTheme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'features/planets/application/routing/app_router.dart';
import 'core/utils/app_logger.dart';
import 'firebase_options.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    AppLogger.log('Flutter inicializado', tag: 'Main');
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    AppLogger.log('Firebase inicializado', tag: 'Main');
    runApp(const ProviderScope(child: AlleyPlanets()));
  } catch (e, stack) {
    AppLogger.log('Error en inicialización: $e\n$stack', tag: 'Main');
    rethrow;
  }
}

class AlleyPlanets extends ConsumerWidget {
  const AlleyPlanets({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routerConfig: router,
      title: 'Alley planets',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      builder: (context, child) {
        final mediaQuery = MediaQuery.of(context);
        final screenWidth = mediaQuery.size.width;

        // Adjust scale factor based on device width
        double scaleFactor;
        if (screenWidth < 600) {
          scaleFactor = 1.0; // mobile
        } else if (screenWidth < 1200) {
          scaleFactor = 1.2; // tablet
        } else {
          scaleFactor = 1.4; // desktop
        }
        return MediaQuery(
          data: mediaQuery.copyWith(
            textScaler: TextScaler.linear(scaleFactor),
          ),
          child: child!,
        );
      },
    );
  }
}
