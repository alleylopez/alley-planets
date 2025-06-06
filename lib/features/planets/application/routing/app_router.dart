//import 'package:alley_planets/features/planets/presentation/aux/splash_debug.dart';
import 'package:alley_planets/features/planets/presentation/home_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [GoRoute(path: '/', builder: (context, state) => HomeScreen())],
  );
});
