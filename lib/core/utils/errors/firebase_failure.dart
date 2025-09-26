part of 'failure.dart';

/// Base sellada para errores provenientes de servicios Firebase.
sealed class FirebaseFailure extends Failure {
  const FirebaseFailure({required String message, String? code})
      : super(message, code: code);

  /// Crea una instancia concreta a partir de un código de error de Firebase.
  factory FirebaseFailure.fromCode(String code, {String? message}) {
    final normalizedCode = code.toLowerCase();
    final resolvedMessage = message ?? _defaultMessageForCode(normalizedCode);
    return switch (normalizedCode) {
      'cancelled' => FirebaseCancelledFailure(message: resolvedMessage),
      'unknown' => FirebaseUnknownFailure(message: resolvedMessage),
      'invalid-argument' => FirebaseInvalidArgumentFailure(message: resolvedMessage),
      'deadline-exceeded' => FirebaseDeadlineExceededFailure(message: resolvedMessage),
      'not-found' => FirebaseNotFoundFailure(message: resolvedMessage),
      'already-exists' => FirebaseAlreadyExistsFailure(message: resolvedMessage),
      'permission-denied' => FirebasePermissionDeniedFailure(message: resolvedMessage),
      'resource-exhausted' => FirebaseResourceExhaustedFailure(message: resolvedMessage),
      'failed-precondition' => FirebaseFailedPreconditionFailure(message: resolvedMessage),
      'aborted' => FirebaseAbortedFailure(message: resolvedMessage),
      'out-of-range' => FirebaseOutOfRangeFailure(message: resolvedMessage),
      'unimplemented' => FirebaseUnimplementedFailure(message: resolvedMessage),
      'internal' => FirebaseInternalFailure(message: resolvedMessage),
      'unavailable' => FirebaseUnavailableFailure(message: resolvedMessage),
      'data-loss' => FirebaseDataLossFailure(message: resolvedMessage),
      'unauthenticated' => FirebaseUnauthenticatedFailure(message: resolvedMessage),
      _ => FirebaseUnknownFailure(message: resolvedMessage, code: normalizedCode),
    };
  }
}

final class FirebaseCancelledFailure extends FirebaseFailure {
  const FirebaseCancelledFailure({required String message})
      : super(message: message, code: 'cancelled');
}

final class FirebaseUnknownFailure extends FirebaseFailure {
  const FirebaseUnknownFailure({required String message, String? code})
      : super(message: message, code: code ?? 'unknown');
}

final class FirebaseInvalidArgumentFailure extends FirebaseFailure {
  const FirebaseInvalidArgumentFailure({required String message})
      : super(message: message, code: 'invalid-argument');
}

final class FirebaseDeadlineExceededFailure extends FirebaseFailure {
  const FirebaseDeadlineExceededFailure({required String message})
      : super(message: message, code: 'deadline-exceeded');
}

final class FirebaseNotFoundFailure extends FirebaseFailure {
  const FirebaseNotFoundFailure({required String message})
      : super(message: message, code: 'not-found');
}

final class FirebaseAlreadyExistsFailure extends FirebaseFailure {
  const FirebaseAlreadyExistsFailure({required String message})
      : super(message: message, code: 'already-exists');
}

final class FirebasePermissionDeniedFailure extends FirebaseFailure {
  const FirebasePermissionDeniedFailure({required String message})
      : super(message: message, code: 'permission-denied');
}

final class FirebaseResourceExhaustedFailure extends FirebaseFailure {
  const FirebaseResourceExhaustedFailure({required String message})
      : super(message: message, code: 'resource-exhausted');
}

final class FirebaseFailedPreconditionFailure extends FirebaseFailure {
  const FirebaseFailedPreconditionFailure({required String message})
      : super(message: message, code: 'failed-precondition');
}

final class FirebaseAbortedFailure extends FirebaseFailure {
  const FirebaseAbortedFailure({required String message})
      : super(message: message, code: 'aborted');
}

final class FirebaseOutOfRangeFailure extends FirebaseFailure {
  const FirebaseOutOfRangeFailure({required String message})
      : super(message: message, code: 'out-of-range');
}

final class FirebaseUnimplementedFailure extends FirebaseFailure {
  const FirebaseUnimplementedFailure({required String message})
      : super(message: message, code: 'unimplemented');
}

final class FirebaseInternalFailure extends FirebaseFailure {
  const FirebaseInternalFailure({required String message})
      : super(message: message, code: 'internal');
}

final class FirebaseUnavailableFailure extends FirebaseFailure {
  const FirebaseUnavailableFailure({required String message})
      : super(message: message, code: 'unavailable');
}

final class FirebaseDataLossFailure extends FirebaseFailure {
  const FirebaseDataLossFailure({required String message})
      : super(message: message, code: 'data-loss');
}

final class FirebaseUnauthenticatedFailure extends FirebaseFailure {
  const FirebaseUnauthenticatedFailure({required String message})
      : super(message: message, code: 'unauthenticated');
}

String _defaultMessageForCode(String code) => switch (code) {
      'cancelled' => 'La operación fue cancelada.',
      'invalid-argument' => 'Argumentos inválidos para la solicitud.',
      'deadline-exceeded' => 'El tiempo de espera se agotó.',
      'not-found' => 'El recurso solicitado no existe.',
      'already-exists' => 'El recurso ya existe.',
      'permission-denied' => 'No tienes permisos para realizar esta acción.',
      'resource-exhausted' => 'Se alcanzó el límite de recursos disponibles.',
      'failed-precondition' => 'No se cumplió una condición previa requerida.',
      'aborted' => 'La operación fue abortada.',
      'out-of-range' => 'La solicitud excede el rango permitido.',
      'unimplemented' => 'Funcionalidad no implementada.',
      'internal' => 'Error interno del servicio.',
      'unavailable' => 'Servicio temporalmente no disponible.',
      'data-loss' => 'Se ha producido pérdida de datos.',
      'unauthenticated' => 'Debes iniciar sesión para continuar.',
      _ => 'Error de Firebase (${code.isEmpty ? 'desconocido' : code}).',
    };

/// Traduce una falla de Firebase a un mensaje para mostrar en UI.
String describeFirebaseFailure(FirebaseFailure failure) => switch (failure) {
      FirebasePermissionDeniedFailure() =>
        'No tienes permisos para acceder a este recurso.',
      FirebaseUnavailableFailure() =>
        'Servicio de Firebase temporalmente no disponible.',
      FirebaseUnauthenticatedFailure() => 'Debes iniciar sesión para continuar.',
      FirebaseDeadlineExceededFailure() =>
        'La operación tardó demasiado. Intenta de nuevo.',
      FirebaseNotFoundFailure() => 'No se encontró la información solicitada.',
      FirebaseFailure() => failure.message,
    };
