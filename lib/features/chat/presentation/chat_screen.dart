import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kinsen_ops/core/theme/app_theme.dart';
import 'package:kinsen_ops/features/chat/domain/models/chat.dart';
import 'package:kinsen_ops/features/chat/presentation/chat_controller.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:intl/intl.dart';

class ChatScreen extends ConsumerWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final channels = ref.watch(channelsProvider);
    final selectedChannelId = ref.watch(selectedChannelProvider);

    return Scaffold(
      body: Row(
        children: [
          _buildChannelSidebar(context, channels, selectedChannelId, ref),
          const VerticalDivider(width: 1),
          Expanded(
            child: selectedChannelId == null
                ? _buildEmptyState(context)
                : _buildMessageView(context, selectedChannelId, ref),
          ),
        ],
      ),
    );
  }

  Widget _buildChannelSidebar(BuildContext context, List<ChatChannel> channels, String? selectedId, WidgetRef ref) {
    return SizedBox(
      width: 300,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Conversations', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                IconButton(icon: const Icon(LucideIcons.messageSquarePlus, size: 20), onPressed: () {}),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: channels.length,
              itemBuilder: (context, index) {
                final channel = channels[index];
                final isSelected = channel.id == selectedId;
                return ListTile(
                  selected: isSelected,
                  onTap: () {
                    ref.read(selectedChannelProvider.notifier).state = channel.id;
                    ref.read(channelsProvider.notifier).markAsRead(channel.id);
                  },
                  leading: _buildChannelAvatar(channel),
                  title: Text(channel.name, style: TextStyle(fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
                  subtitle: Text(channel.type.toUpperCase(), style: const TextStyle(fontSize: 10, color: AppTheme.textSecondary)),
                  trailing: channel.unreadCount > 0
                      ? Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(color: AppTheme.primary, shape: BoxShape.circle),
                          child: Text(channel.unreadCount.toString(), style: const TextStyle(color: Colors.white, fontSize: 10)),
                        )
                      : null,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChannelAvatar(ChatChannel channel) {
    IconData icon;
    Color color;
    switch (channel.type) {
      case 'group': icon = LucideIcons.users; color = Colors.blue; break;
      case 'entity': icon = LucideIcons.car; color = Colors.orange; break;
      default: icon = LucideIcons.user; color = AppTheme.primary;
    }
    return CircleAvatar(
      backgroundColor: color.withOpacity(0.1),
      child: Icon(icon, color: color, size: 20),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(LucideIcons.messageSquare, size: 64, color: AppTheme.divider),
          SizedBox(height: 16),
          Text('Select a conversation to start chatting', style: TextStyle(color: AppTheme.textSecondary)),
        ],
      ),
    );
  }

  Widget _buildMessageView(BuildContext context, String channelId, WidgetRef ref) {
    final messages = ref.watch(messagesProvider(channelId));
    final channel = ref.watch(channelsProvider).firstWhere((c) => c.id == channelId);
    final TextEditingController controller = TextEditingController();

    return Column(
      children: [
        _buildChannelHeader(context, channel),
        const Divider(height: 1),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(24),
            reverse: false, // For now simple top-to-bottom
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final message = messages[index];
              final isMe = message.senderId == 'me';
              return _MessageBubble(message: message, isMe: isMe);
            },
          ),
        ),
        _buildMessageInput(context, channelId, controller, ref),
      ],
    );
  }

  Widget _buildChannelHeader(BuildContext context, ChatChannel channel) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          _buildChannelAvatar(channel),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(channel.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const Text('Online', style: TextStyle(color: Colors.green, fontSize: 12)),
            ],
          ),
          const Spacer(),
          IconButton(icon: const Icon(LucideIcons.info), onPressed: () {}),
        ],
      ),
    );
  }

  Widget _buildMessageInput(BuildContext context, String channelId, TextEditingController controller, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: AppTheme.surfaceGlass,
        border: Border(top: BorderSide(color: AppTheme.divider)),
      ),
      child: Row(
        children: [
          IconButton(icon: const Icon(LucideIcons.plus), onPressed: () {}),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Type a message...',
                filled: true,
                fillColor: AppTheme.background,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide.none),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              onSubmitted: (val) {
                if (val.trim().isNotEmpty) {
                  ref.read(messagesProvider(channelId).notifier).sendMessage(val);
                  controller.clear();
                }
              },
            ),
          ),
          const SizedBox(width: 16),
          IconButton(
            icon: const Icon(LucideIcons.send, color: AppTheme.primary),
            onPressed: () {
              if (controller.text.trim().isNotEmpty) {
                ref.read(messagesProvider(channelId).notifier).sendMessage(controller.text);
                controller.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}

class _MessageBubble extends StatelessWidget {
  final ChatMessage message;
  final bool isMe;

  const _MessageBubble({required this.message, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isMe) ...[
            const CircleAvatar(radius: 16, backgroundColor: AppTheme.surface, child: Icon(LucideIcons.user, size: 14)),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Column(
              crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                if (!isMe)
                  Padding(
                    padding: const EdgeInsets.only(left: 4, bottom: 4),
                    child: Text(message.senderName, style: const TextStyle(fontSize: 10, color: AppTheme.textSecondary)),
                  ),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isMe ? AppTheme.primary : AppTheme.surface,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(16),
                      topRight: const Radius.circular(16),
                      bottomLeft: Radius.circular(isMe ? 16 : 4),
                      bottomRight: Radius.circular(isMe ? 4 : 16),
                    ),
                  ),
                  child: Text(
                    message.content,
                    style: TextStyle(color: isMe ? Colors.white : AppTheme.textPrimary),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4, left: 4, right: 4),
                  child: Text(
                    DateFormat('HH:mm').format(message.timestamp),
                    style: const TextStyle(fontSize: 8, color: AppTheme.textSecondary),
                  ),
                ),
              ],
            ),
          ),
          if (isMe) ...[
            const SizedBox(width: 8),
            const Icon(LucideIcons.checkCheck, size: 12, color: AppTheme.primary),
          ],
        ],
      ),
    );
  }
}
