/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

/// Represents a channel in the system
abstract class Channel implements _i1.SerializableModel {
  Channel._({
    this.id,
    required this.channelId,
  });

  factory Channel({
    int? id,
    required String channelId,
  }) = _ChannelImpl;

  factory Channel.fromJson(Map<String, dynamic> jsonSerialization) {
    return Channel(
      id: jsonSerialization['id'] as int?,
      channelId: jsonSerialization['channelId'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  /// The id of the channel
  String channelId;

  Channel copyWith({
    int? id,
    String? channelId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'channelId': channelId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ChannelImpl extends Channel {
  _ChannelImpl({
    int? id,
    required String channelId,
  }) : super._(
          id: id,
          channelId: channelId,
        );

  @override
  Channel copyWith({
    Object? id = _Undefined,
    String? channelId,
  }) {
    return Channel(
      id: id is int? ? id : this.id,
      channelId: channelId ?? this.channelId,
    );
  }
}
