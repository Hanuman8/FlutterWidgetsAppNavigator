import 'package:flutter/widgets.dart';

const double _headerHeight = 56.0;
const double _headerPadding = 16.0;

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        return PageRouteBuilder(
          pageBuilder: (context, _, __) => const SettingsMainMenu(),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        );
      },
    );
  }
}

class SettingsHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onBack;

  const SettingsHeader({
    super.key,
    required this.title,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _headerHeight + MediaQuery.of(context).padding.top,
      decoration: const BoxDecoration(
        color: Color(0xFF1A237E),
        boxShadow: [
          BoxShadow(
            color: Color(0x29000000),
            offset: Offset(0, 1),
            blurRadius: 3,
          ),
        ],
      ),
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          height: _headerHeight,
          child: Row(
            children: [
              if (onBack != null)
                GestureDetector(
                  onTap: onBack,
                  behavior: HitTestBehavior.opaque,
                  child: Container(
                    width: _headerHeight,
                    height: _headerHeight,
                    alignment: Alignment.center,
                    child: const Text(
                      '⬅️',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: EdgeInsets.only(
                  left: onBack == null ? _headerPadding : 0,
                ),
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsMainMenu extends StatelessWidget {
  const SettingsMainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFFFFFF),
      child: Column(
        children: [
          const SettingsHeader(title: 'Settings'),
          const SizedBox(height: 16),
          _buildMenuItem(
            'Account Settings',
            '👤',
            () => _navigateToSettingsPage(context, const SettingsAccountPage()),
          ),
          _buildMenuItem(
            'Privacy Settings',
            '🔒',
            () => _navigateToSettingsPage(context, const SettingsPrivacyPage()),
          ),
          _buildMenuItem(
            'Notifications',
            '🔔',
            () => _navigateToSettingsPage(context, const SettingsNotificationsPage()),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String title, String emoji, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Color(0x1A000000),
              offset: Offset(0, 1),
              blurRadius: 2,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                emoji,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Text(
              '➡️',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToSettingsPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, _, __) => page,
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }
}

class SettingsAccountPage extends StatelessWidget {
  const SettingsAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFFFFFF),
      child: Column(
        children: [
          SettingsHeader(
            title: 'Account Settings',
            onBack: () => Navigator.of(context).pop(),
          ),
          const Expanded(
            child: Center(
              child: Text('Account Settings Content'),
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsPrivacyPage extends StatelessWidget {
  const SettingsPrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFFFFFF),
      child: Column(
        children: [
          SettingsHeader(
            title: 'Privacy Settings',
            onBack: () => Navigator.of(context).pop(),
          ),
          const Expanded(
            child: Center(
              child: Text('Privacy Settings Content'),
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsNotificationsPage extends StatelessWidget {
  const SettingsNotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFFFFFF),
      child: Column(
        children: [
          SettingsHeader(
            title: 'Notifications',
            onBack: () => Navigator.of(context).pop(),
          ),
          const Expanded(
            child: Center(
              child: Text('Notifications Settings Content'),
            ),
          ),
        ],
      ),
    );
  }
}