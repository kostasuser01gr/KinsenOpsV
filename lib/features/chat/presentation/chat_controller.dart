import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kinsen_ops/features/chat/domain/models/chat.dart';
import 'package:uuid/uuid.dart';

// Current active channel
final selectedChannelProvider = StateProvider<String?>((ref) => null);

// Channels state
final channelsProvider = StateNotifierProvider<ChannelsNotifier, List<ChatChannel>>((ref) {
  return ChannelsNotifier();
});

// Messages state for a given channel
final messagesProvider = StateNotifierProvider.family<MessagesNotifier, List<ChatMessage>, String>((ref, channelId) {
  return MessagesNotifier(channelId);
});

// User presence state
final presenceProvider = StateNotifierProvider<PresenceNotifier, Map<String, UserPresence>>((ref) {
  return PresenceNotifier();
});

// Ops Inbox (Notifications)
final opsInboxProvider = StateNotifierProvider<OpsInboxNotifier, List<OpsNotification>>((ref) {
  return OpsInboxNotifier();
});

class ChannelsNotifier extends StateNotifier<List<ChatChannel>> {
  ChannelsNotifier() : super([]) {
    _loadMockData();
  }

  void _loadMockData() {
    state = [
      const ChatChannel(id: 'c1', name: 'General Ops', type: 'group', unreadCount: 5),
      const ChatChannel(id: 'c2', name: 'Washers Team', type: 'group'),
      const ChatChannel(id: 'dm1', name: 'John Doe', type: 'dm'),
      const ChatChannel(id: 'v123', name: 'ZXY-1234 (Toyota)', type: 'entity', linkedEntityId: 'v1'),
    ];
  }

  void markAsRead(String channelId) {
    state = [
      for (final c in state)
        if (c.id == channelId) c.copyWith(unreadCount: 0) else c,
    ];
  }
}

class MessagesNotifier extends StateNotifier<List<ChatMessage>> {
  final String channelId;
  MessagesNotifier(this.channelId) : super([]) {
    _loadMockData();
  }

  void _loadMockData() {
    final now = DateTime.now();
    state = [
      ChatMessage(
        id: 'm1',
        senderId: 'u1',
        senderName: 'John Doe',
        content: 'Has the Toyota Corolla ZXY-1234 been cleaned?',
        timestamp: now.subtract(const Duration(minutes: 30)),
      ),
      ChatMessage(
        id: 'm2',
        senderId: 'u2',
        senderName: 'Maria Garcia',
        content: 'Yes, just finished it. QC passed.',
        timestamp: now.subtract(const Duration(minutes: 10)),
        replyToId: 'm1',
      ),
    ];
  }

  void sendMessage(String content, {String? senderId, String? senderName}) {
    final newMessage = ChatMessage(
      id: const Uuid().v4(),
      senderId: senderId ?? 'me',
      senderName: senderName ?? 'You',
      content: content,
      timestamp: DateTime.now(),
    );
    state = [...state, newMessage];
  }
}

class PresenceNotifier extends StateNotifier<Map<String, UserPresence>> {
  PresenceNotifier() : super({}) {
    _loadMockData();
  }

  void _loadMockData() {
    state = {
      'u1': UserPresence(userId: 'u1', isOnline: true, lastSeen: DateTime.now()),
      'u2': UserPresence(userId: 'u2', isOnline: false, lastSeen: DateTime.now().subtract(const Duration(hours: 1))),
    };
  }
}

class OpsInboxNotifier extends StateNotifier<List<OpsNotification>> {
  OpsInboxNotifier() : super([]) {
    _loadMockData();
  }

  void _loadMockData() {
    state = [
      OpsNotification(
        id: 'n1',
        title: 'QC Fail',
        message: 'BMW 3 Series (BAD-9999) failed QC - Exterior spots.',
        severity: 'warning',
        timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
        entityId: 'v4',
      ),
      OpsNotification(
        id: 'n2',
        title: 'Late Shift',
        message: 'Kostas P. is 15 mins late for the Coordinator shift.',
        severity: 'error',
        timestamp: DateTime.now().subtract(const Duration(minutes: 15)),
      ),
      OpsNotification(
        id: 'n3',
        title: 'SLA Breach',
        message: 'Wash task for ABC-5678 exceeded 45 mins.',
        severity: 'urgent',
        timestamp: DateTime.now().subtract(const Duration(minutes: 2)),
      ),
    ];
  }

  void acknowledge(String id) {
    state = [
      for (final n in state)
        if (n.id == id) n.copyWith(isAcknowledged: true) else n,
    ];
  }
}
