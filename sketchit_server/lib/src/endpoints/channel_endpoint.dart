import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

class ChannelEndpoint extends Endpoint {
  String _getChannelId(StreamingSession session) {
    return session.queryParameters['id'] ?? '';
  }

  @override
  Future<void> streamOpened(StreamingSession session) async {
    final channelId = _getChannelId(session);

    // Add listener to channel
    session.messages.addListener(channelId, (update) {
      sendStreamMessage(session, update);
    });
  }

  @override
  Future<void> handleStreamMessage(
    StreamingSession session,
    SerializableModel message,
  ) async {
    if (message is ChannelMessage) {
      final channelId = _getChannelId(session);
      session.messages.postMessage(channelId, message);
    }
  }
}
