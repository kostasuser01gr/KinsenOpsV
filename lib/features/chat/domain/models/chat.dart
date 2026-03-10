import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat.freezed.dart';
part 'chat.g.dart';

@freezed
class ChatMessage with _$ChatMessage {
  const factory ChatMessage({
    required String id,
    required String senderId,
    required String senderName,
    required String content,
    required DateTime timestamp,
    @Default([]) List<String> attachments,
    String? replyToId,
    @Default({}) Map<String, int> reactions,
    String? entityId, // ID of the linked vehicle, shift, or task
    String? entityType, // 'vehicle', 'shift', 'wash'
  }) = _ChatMessage;

  factory ChatMessage.fromJson(Map<String, dynamic> json) => _$ChatMessageFromJson(json);
}

@freezed
class ChatChannel with _$ChatChannel {
  const factory ChatChannel({
    required String id,
    required String name,
    required String type, // 'group', 'dm', 'entity'
    String? description,
    @Default([]) List<String> memberIds,
    ChatMessage? lastMessage,
    @Default(0) int unreadCount,
    String? linkedEntityId,
  }) = _ChatChannel;

  factory ChatChannel.fromJson(Map<String, dynamic> json) => _$ChatChannelFromJson(json);
}

@freezed
class UserPresence with _$UserPresence {
  const factory UserPresence({
    required String userId,
    required bool isOnline,
    required DateTime lastSeen,
  }) = _UserPresence;

  factory UserPresence.fromJson(Map<String, dynamic> json) => _$UserPresenceFromJson(json);
}

@freezed
class OpsNotification with _$OpsNotification {
  const factory OpsNotification({
    required String id,
    required String title,
    required String message,
    required DateTime timestamp,
    required String severity, // 'info', 'warning', 'error', 'urgent'
    @Default(false) bool isRead,
    @Default(false) bool isAcknowledged,
    String? actionLink,
    String? entityId,
  }) = _OpsNotification;

  factory OpsNotification.fromJson(Map<String, dynamic> json) => _$OpsNotificationFromJson(json);
}
