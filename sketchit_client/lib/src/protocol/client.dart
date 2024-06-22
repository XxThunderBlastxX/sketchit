/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:sketchit_client/src/protocol/channel.dart' as _i3;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i4;
import 'package:serverpod_chat_client/serverpod_chat_client.dart' as _i5;
import 'protocol.dart' as _i6;

/// {@category Endpoint}
class EndpointChannel extends _i1.EndpointRef {
  EndpointChannel(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'channel';

  _i2.Future<List<_i3.Channel>> getChannels() =>
      caller.callServerEndpoint<List<_i3.Channel>>(
        'channel',
        'getChannels',
        {},
      );

  _i2.Future<_i3.Channel> createChannel(String channelId) =>
      caller.callServerEndpoint<_i3.Channel>(
        'channel',
        'createChannel',
        {'channelId': channelId},
      );
}

class _Modules {
  _Modules(Client client) {
    auth = _i4.Caller(client);
    chat = _i5.Caller(client);
  }

  late final _i4.Caller auth;

  late final _i5.Caller chat;
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
  }) : super(
          host,
          _i6.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
        ) {
    channel = EndpointChannel(this);
    modules = _Modules(this);
  }

  late final EndpointChannel channel;

  late final _Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {'channel': channel};

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {
        'auth': modules.auth,
        'chat': modules.chat,
      };
}
