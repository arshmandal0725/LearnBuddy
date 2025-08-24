import 'package:flutter/material.dart';

/// Dummy Settings Screen
/// Includes common cards & options:
///  - Profile
///  - Account
///  - Notifications
///  - Privacy & Security
///  - Chats
///  - Data & Storage
///  - Help & Support
///  - About
///  - Logout
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = const Color(0xFFE24C00);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: primaryColor,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          _SettingsCard(
            icon: Icons.person,
            title: "Profile",
            subtitle: "Edit name, photo & info",
            onTap: () {},
          ),
          _SettingsCard(
            icon: Icons.account_circle,
            title: "Account",
            subtitle: "Privacy, security, change number",
            onTap: () {},
          ),
          _SettingsCard(
            icon: Icons.notifications,
            title: "Notifications",
            subtitle: "Message, group & call tones",
            onTap: () {},
          ),
          _SettingsCard(
            icon: Icons.lock,
            title: "Privacy & Security",
            subtitle: "Blocked contacts, fingerprint lock",
            onTap: () {},
          ),
          _SettingsCard(
            icon: Icons.chat,
            title: "Chats",
            subtitle: "Theme, wallpapers, chat history",
            onTap: () {},
          ),
          _SettingsCard(
            icon: Icons.storage,
            title: "Data & Storage",
            subtitle: "Network usage, auto-download",
            onTap: () {},
          ),
          _SettingsCard(
            icon: Icons.help_outline,
            title: "Help & Support",
            subtitle: "FAQ, contact us, app info",
            onTap: () {},
          ),
          _SettingsCard(
            icon: Icons.info_outline,
            title: "About",
            subtitle: "App version, licenses",
            onTap: () {},
          ),
          const Divider(),
          _SettingsCard(
            icon: Icons.logout,
            title: "Logout",
            subtitle: "Sign out from this device",
            iconColor: Colors.redAccent,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _SettingsCard extends StatelessWidget {
  const _SettingsCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.iconColor,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: (iconColor ?? Theme.of(context).primaryColor)
              .withOpacity(0.1),
          child: Icon(icon, color: iconColor ?? Theme.of(context).primaryColor),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle),
        onTap: onTap,
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}

// Demo App
class SettingsScreenDemoApp extends StatelessWidget {
  const SettingsScreenDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFE24C00),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFFE24C00),
        ),
      ),
      home: const SettingsScreen(),
    );
  }
}
