export 'messages.dart';

abstract class Failure implements Exception {
  String? get message;
}
