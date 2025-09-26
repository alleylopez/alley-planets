part 'http_failure.dart';
part 'firebase_failure.dart';

/// Base sellada para representar fallas de infraestructura.
sealed class Failure {
  final String message;
  final String? code; // Identificador genérico (HTTP status, código Firebase, etc.)
  const Failure(this.message, {this.code});
}
