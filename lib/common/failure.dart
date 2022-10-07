// Failure Condition
import 'package:equatable/equatable.dart';

abstract class FailureCondition extends Equatable {
  final String message;

  const FailureCondition(this.message);

  @override
  List<Object> get props => [message];
}

// Server Failure
class ServerFailure extends FailureCondition {
  const ServerFailure(String message) : super(message);
}

// Connection Failure
class ConnectionFailure extends FailureCondition {
  const ConnectionFailure(String message) : super(message);
}

// Database Failure
class DatabaseFailure extends FailureCondition {
  const DatabaseFailure(String message) : super(message);
}

// SSL Failure
class SslFailure extends FailureCondition {
  const SslFailure(String message) : super(message);
}
