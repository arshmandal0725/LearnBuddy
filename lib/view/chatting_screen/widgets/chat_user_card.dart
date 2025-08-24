import 'package:flutter/material.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
    super.key,
    this.avatarUrl,
    required this.name,
    required this.lastMessage,
    this.isOnline = false,
    this.lastSeenText,
    this.unreadCount = 0,
    this.onTap,
    this.onLongPress,
  });

  /// Network image URL for the avatar. If null/empty, initials are shown.
  final String? avatarUrl;

  /// Display name of the user/chat.
  final String name;

  /// Last message preview.
  final String lastMessage;

  /// Whether the user is currently online. Overrides [lastSeenText] badge.
  final bool isOnline;

  /// A short last-seen text (e.g., "10:45 AM" or "2h ago"). Used when [isOnline] is false.
  final String? lastSeenText;

  /// Number of unread messages. If 0, the badge is hidden.
  final int unreadCount;

  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          children: [
            _AvatarWithPresence(
              radius: 28,
              avatarUrl: avatarUrl,
              name: name,
              isOnline: isOnline,
              lastSeenText: lastSeenText,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    lastMessage,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.textTheme.bodyMedium?.color?.withOpacity(
                        0.75,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            if (unreadCount > 0)
              _UnreadBadge(count: unreadCount)
            else
              const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

class _AvatarWithPresence extends StatelessWidget {
  const _AvatarWithPresence({
    required this.radius,
    required this.avatarUrl,
    required this.name,
    required this.isOnline,
    required this.lastSeenText,
  });

  final double radius;
  final String? avatarUrl;
  final String name;
  final bool isOnline;
  final String? lastSeenText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: radius * 2 + 8, // extra space to allow presence chip to hang out
      height: radius * 2 + 8,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Avatar
          Positioned.fill(
            child: _CircleAvatarFallback(
              radius: radius,
              avatarUrl: avatarUrl,
              name: name,
            ),
          ),
          // Presence/Last seen badge at bottom-right
          Positioned(
            right: -2,
            bottom: -2,
            child: isOnline
                ? _OnlineDot()
                : (lastSeenText == null || lastSeenText!.trim().isEmpty)
                ? const SizedBox.shrink()
                : _LastSeenChip(text: lastSeenText!),
          ),
        ],
      ),
    );
  }
}

class _CircleAvatarFallback extends StatelessWidget {
  const _CircleAvatarFallback({
    required this.radius,
    required this.avatarUrl,
    required this.name,
  });

  final double radius;
  final String? avatarUrl;
  final String name;

  @override
  Widget build(BuildContext context) {
    final initials = _initialsFromName(name);

    if (avatarUrl != null && avatarUrl!.trim().isNotEmpty) {
      return CircleAvatar(
        radius: radius,
        backgroundImage: NetworkImage(avatarUrl!),
        backgroundColor: Colors.transparent,
      );
    }

    return CircleAvatar(
      radius: radius,
      child: Text(
        initials,
        style: const TextStyle(fontWeight: FontWeight.w700),
      ),
    );
  }

  String _initialsFromName(String name) {
    final parts = name.trim().split(RegExp(r"\s+"));
    if (parts.isEmpty) return "?";
    if (parts.length == 1) return parts.first[0].toUpperCase();
    return (parts[0][0] + parts[1][0]).toUpperCase();
  }
}

class _OnlineDot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      child: const CircleAvatar(radius: 7, backgroundColor: Colors.green),
    );
  }
}

class _LastSeenChip extends StatelessWidget {
  const _LastSeenChip({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            offset: const Offset(0, 1),
            color: Colors.black.withOpacity(0.08),
          ),
        ],
        border: Border.all(
          color: theme.dividerColor.withOpacity(0.5),
          width: 0.5,
        ),
      ),
      child: Text(
        text,
        style: theme.textTheme.labelSmall?.copyWith(
          fontFeatures: const [FontFeature.tabularFigures()],
        ),
      ),
    );
  }
}

class _UnreadBadge extends StatelessWidget {
  const _UnreadBadge({required this.count});
  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 22, minHeight: 22),
      padding: const EdgeInsets.symmetric(horizontal: 6),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.circular(11),
      ),
      child: Text(
        count > 99 ? '99+' : '$count',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
