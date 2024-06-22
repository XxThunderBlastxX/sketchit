/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

/// Represents a channel in the system
abstract class Channel extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  Channel._({
    int? id,
    required this.channelId,
  }) : super(id);

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

  static final t = ChannelTable();

  static const db = ChannelRepository._();

  /// The id of the channel
  String channelId;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'channelId': channelId,
    };
  }

  static ChannelInclude include() {
    return ChannelInclude._();
  }

  static ChannelIncludeList includeList({
    _i1.WhereExpressionBuilder<ChannelTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ChannelTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ChannelTable>? orderByList,
    ChannelInclude? include,
  }) {
    return ChannelIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Channel.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Channel.t),
      include: include,
    );
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

class ChannelTable extends _i1.Table {
  ChannelTable({super.tableRelation}) : super(tableName: 'channel') {
    channelId = _i1.ColumnString(
      'channelId',
      this,
    );
  }

  /// The id of the channel
  late final _i1.ColumnString channelId;

  @override
  List<_i1.Column> get columns => [
        id,
        channelId,
      ];
}

class ChannelInclude extends _i1.IncludeObject {
  ChannelInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Channel.t;
}

class ChannelIncludeList extends _i1.IncludeList {
  ChannelIncludeList._({
    _i1.WhereExpressionBuilder<ChannelTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Channel.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Channel.t;
}

class ChannelRepository {
  const ChannelRepository._();

  Future<List<Channel>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ChannelTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ChannelTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ChannelTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Channel>(
      where: where?.call(Channel.t),
      orderBy: orderBy?.call(Channel.t),
      orderByList: orderByList?.call(Channel.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Channel?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ChannelTable>? where,
    int? offset,
    _i1.OrderByBuilder<ChannelTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ChannelTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Channel>(
      where: where?.call(Channel.t),
      orderBy: orderBy?.call(Channel.t),
      orderByList: orderByList?.call(Channel.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Channel?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Channel>(
      id,
      transaction: transaction,
    );
  }

  Future<List<Channel>> insert(
    _i1.Session session,
    List<Channel> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Channel>(
      rows,
      transaction: transaction,
    );
  }

  Future<Channel> insertRow(
    _i1.Session session,
    Channel row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Channel>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Channel>> update(
    _i1.Session session,
    List<Channel> rows, {
    _i1.ColumnSelections<ChannelTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Channel>(
      rows,
      columns: columns?.call(Channel.t),
      transaction: transaction,
    );
  }

  Future<Channel> updateRow(
    _i1.Session session,
    Channel row, {
    _i1.ColumnSelections<ChannelTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Channel>(
      row,
      columns: columns?.call(Channel.t),
      transaction: transaction,
    );
  }

  Future<List<Channel>> delete(
    _i1.Session session,
    List<Channel> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Channel>(
      rows,
      transaction: transaction,
    );
  }

  Future<Channel> deleteRow(
    _i1.Session session,
    Channel row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Channel>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Channel>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ChannelTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Channel>(
      where: where(Channel.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ChannelTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Channel>(
      where: where?.call(Channel.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
