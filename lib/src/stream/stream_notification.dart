import 'dart:async';

class StreamNotification {

static final StreamNotification streamNotification = new StreamNotification._internal();

  factory StreamNotification() { return streamNotification; } 
  StreamNotification._internal();

  StreamController _streamController = new StreamController<int>();

  Stream<int> get notificationUpdate => _streamController.stream;

  notificationCounter(value) => _streamController.add(value);

  dispose() {
    _streamController?.close();
  }
}