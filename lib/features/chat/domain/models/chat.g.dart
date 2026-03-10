// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) => _ChatMessage(
  id: json['id'] as String,
  senderId: json['senderId'] as String,
  senderName: json['senderName'] as String,
  content: json['content'] as String,
  timestamp: DateTime.parse(json['timestamp'] as String),
  attachments:
      (json['attachments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  replyToId: json['replyToId'] as String?,
  reactions:
      (json['reactions'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toInt()),
      ) ??
      const {},
  entityId: json['entityId'] as String?,
  entityType: json['entityType'] as String?,
);

Map<String, dynamic> _$ChatMessageToJson(_ChatMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'senderId': instance.senderId,
      'senderName': instance.senderName,
      'content': instance.content,
      'timestamp': instance.timestamp.toIso8601String(),
      'attachments': instance.attachments,
      'replyToId': instance.replyToId,
      'reactions': instance.reactions,
      'entityId': instance.entityId,
      'entityType': instance.entityType,
    };

_ChatChannel _$ChatChannelFromJson(Map<String, dynamic> json) => _ChatChannel(
  id: json['id'] as String,
  name: json['name'] as String,
  type: json['type'] as String,
  description: json['description'] as String?,
  memberIds:
      (json['memberIds'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  lastMessage: json['lastMessage'] == null
      ? null
      : ChatMessage.fromJson(json['lastMessage'] as Map<String, dynamic>),
  unreadCount: (json['unreadCount'] as num?)?.toInt() ?? 0,
  linkedEntityId: json['linkedEntityId'] as String?,
);

Map<String, dynamic> _$ChatChannelToJson(_ChatChannel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'description': instance.description,
      'memberIds': instance.memberIds,
      'lastMessage': instance.lastMessage,
      'unreadCount': instance.unreadCount,
      'linkedEntityId': instance.linkedEntityId,
    };

_UserPresence _$UserPresenceFromJson(Map<String, dynamic> json) =>
    _UserPresence(
      userId: json['userId'] as String,
      isOnline: json['isOnline'] as bool,
      lastSeen: DateTime.parse(json['lastSeen'] as String),
    );

Map<String, dynamic> _$UserPresenceToJson(_UserPresence instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'isOnline': instance.isOnline,
      'lastSeen': instance.lastSeen.toIso8601String(),
    };

_OpsNotification _$OpsNotificationFromJson(Map<String, dynamic> json) =>
    _OpsNotification(
      id: json['id'] as String,
      title: json['title'] as String,
      message: json['message'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      severity: json['severity'] as String,
      isRead: json['isRead'] as bool? ?? false,
      isAcknowledged: json['isAcknowledged'] as bool? ?? false,
      actionLink: json['actionLink'] as String?,
      entityId: json['entityId'] as String?,
    );

Map<String, dynamic> _$OpsNotificationToJson(_OpsNotification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'message': instance.message,
      'timestamp': instance.timestamp.toIso8601String(),
      'severity': instance.severity,
      'isRead': instance.isRead,
      'isAcknowledged': instance.isAcknowledged,
      'actionLink': instance.actionLink,
      'entityId': instance.entityId,
    };
