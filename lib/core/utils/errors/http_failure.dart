part of 'failure.dart';

/// Base sellada para errores HTTP que mantiene el código asociado.
sealed class HttpFailure extends Failure {
  final int? statusCode;

  const HttpFailure({required String message, this.statusCode})
      : super(message);

  /// Mapea un código HTTP crudo a una variante tipada.
  factory HttpFailure.fromStatusCode(int statusCode, {String? message}) {
    final resolvedMessage = message ?? _defaultMessageForStatus(statusCode);
    return switch (statusCode) {
      400 => BadRequestFailure(message: resolvedMessage),
      401 => UnauthorizedFailure(message: resolvedMessage),
      403 => ForbiddenFailure(message: resolvedMessage),
      404 => NotFoundFailure(message: resolvedMessage),
      408 => TimeoutFailure(message: resolvedMessage),
      int code when code >= 500 && code < 600 => ServerErrorFailure(
          message: resolvedMessage,
          statusCode: statusCode,
        ),
      _ => UnknownHttpFailure(
          message: resolvedMessage,
          statusCode: statusCode,
        ),
    };
  }
}

/// Fallo cuando la solicitud es inválida (400).
final class BadRequestFailure extends HttpFailure {
  const BadRequestFailure({required String message, int statusCode = 400})
      : super(message: message, statusCode: statusCode);
}

/// Fallo cuando el usuario no está autenticado (401).
final class UnauthorizedFailure extends HttpFailure {
  const UnauthorizedFailure({required String message, int statusCode = 401})
      : super(message: message, statusCode: statusCode);
}

/// Fallo por falta de permisos (403).
final class ForbiddenFailure extends HttpFailure {
  const ForbiddenFailure({required String message, int statusCode = 403})
      : super(message: message, statusCode: statusCode);
}

/// Fallo cuando el recurso no existe (404).
final class NotFoundFailure extends HttpFailure {
  const NotFoundFailure({required String message, int statusCode = 404})
      : super(message: message, statusCode: statusCode);
}

/// Fallo por timeout explícito (408).
final class TimeoutFailure extends HttpFailure {
  const TimeoutFailure({required String message, int statusCode = 408})
      : super(message: message, statusCode: statusCode);
}

/// Fallos del lado del servidor (5xx).
final class ServerErrorFailure extends HttpFailure {
  const ServerErrorFailure({required String message, required int statusCode})
      : super(message: message, statusCode: statusCode);
}

/// Fallback para códigos o errores HTTP no mapeados.
final class UnknownHttpFailure extends HttpFailure {
  const UnknownHttpFailure({required String message, int? statusCode})
      : super(message: message, statusCode: statusCode);
}

/// Traduce una falla HTTP en un mensaje de usuario legible.
String describeHttpFailure(HttpFailure failure) => switch (failure) {
      UnauthorizedFailure() =>
        'Sesión expirada. Vuelve a iniciar sesión.',
      ForbiddenFailure() =>
        'No tienes permisos para realizar esta acción.',
      NotFoundFailure() => 'Recurso no encontrado.',
      TimeoutFailure() => 'La solicitud tardó demasiado, inténtalo de nuevo.',
      ServerErrorFailure(statusCode: final code) =>
        'El servidor devolvió un error ($code).',
      BadRequestFailure() => 'La solicitud contiene datos inválidos.',
      UnknownHttpFailure(message: final msg) =>
        'Fallo desconocido: $msg',
    };

String _defaultMessageForStatus(int statusCode) => switch (statusCode) {
      400 => 'Solicitud incorrecta.',
      401 => 'No autorizado.',
      403 => 'Acceso denegado.',
      404 => 'No encontrado.',
      408 => 'Tiempo de espera agotado.',
      int code when code >= 500 && code < 600 => 'Error interno del servidor.',
      _ => 'Error HTTP ($statusCode).',
    };
