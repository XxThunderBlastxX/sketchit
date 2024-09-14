/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

/// Represents a message in the system
abstract class ChannelMessage
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  ChannelMessage._({
    required this.channelId,
    required this.message,
  });

  factory ChannelMessage({
    required String channelId,
    required String message,
  }) = _ChannelMessageImpl;

  factory ChannelMessage.fromJson(Map<String, dynamic> jsonSerialization) {
    return ChannelMessage(
      channelId: jsonSerialization['channelId'] as String,
      message: jsonSerialization['message'] as String,
    );
  }

  /// The id of the channel
  String channelId;

  /// message in the channel
  String message;

  ChannelMessage copyWith({
    String? channelId,
    String? message,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'channelId': channelId,
      'message': message,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'channelId': channelId,
      'message': message,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _ChannelMessageImpl extends ChannelMessage {
  _ChannelMessageImpl({
    required String channelId,
    required String message,
  }) : super._(
          channelId: channelId,
          message: message,
        );

  @override
  ChannelMessage copyWith({
    String? channelId,
    String? message,
  }) {
    return ChannelMessage(
      channelId: channelId ?? this.channelId,
      message: message ?? this.message,
    );
  }
}
