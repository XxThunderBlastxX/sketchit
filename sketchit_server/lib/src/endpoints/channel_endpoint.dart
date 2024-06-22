import 'package:serverpod/server.dart';

import '../generated/channel.dart';

class ChannelEndpoint extends Endpoint {
  Future<List<Channel>> getChannels(Session session) async {
    return await Channel.db.find(session);
  }

  Future<Channel> createChannel(Session session, String channelId) async {
    return await Channel.db.insertRow(session, Channel(channelId: channelId));
  }
}
