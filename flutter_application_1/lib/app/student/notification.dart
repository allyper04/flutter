import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  // Track read/unread notifications
  List<bool> readStatus = List.filled(4, false); // Assuming 4 notifications

  void markAsRead(int index) {
    setState(() {
      readStatus[index] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.green, // Custom AppBar color
        elevation: 0, // Remove shadow for a flat look
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            NotificationTile(
              icon: Icons.check_circle,
              color: Colors.green,
              title: 'Requirement Submitted',
              subtitle: 'Your thesis has been successfully submitted.',
              timestamp: '2 hours ago',
              isRead: readStatus[0],
              onTap: () => markAsRead(0),
            ),
            NotificationTile(
              icon: Icons.access_time,
              color: Colors.orange,
              title: 'Upcoming Deadline',
              subtitle: 'Your clearance form is due tomorrow.',
              timestamp: '1 day ago',
              isRead: readStatus[1],
              onTap: () => markAsRead(1),
            ),
            NotificationTile(
              icon: Icons.warning,
              color: Colors.red,
              title: 'Action Required',
              subtitle: 'Your final exam schedule needs confirmation.',
              timestamp: '3 days ago',
              isRead: readStatus[2],
              onTap: () => markAsRead(2),
            ),
            NotificationTile(
              icon: Icons.info,
              color: Colors.blue,
              title: 'New Announcement',
              subtitle: 'Check the latest update from the admin.',
              timestamp: '1 week ago',
              isRead: readStatus[3],
              onTap: () => markAsRead(3),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;
  final String timestamp;
  final bool isRead;
  final VoidCallback onTap;

  const NotificationTile({
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.timestamp,
    required this.isRead,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isRead
          ? Colors.grey[200]
          : Colors.white, // Mark as read by changing background color
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        onTap: onTap, // Make the tile clickable
        leading: Icon(
          icon,
          color: color,
          size: 30, // Smaller icon size for compact design
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isRead
                ? Colors.grey
                : Colors.black, // Change text color for read/unread
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: isRead
                ? Colors.grey
                : Colors.black54, // Change subtitle color for read/unread
          ),
        ),
        trailing: Text(
          timestamp,
          style: TextStyle(
            fontSize: 12,
            color: isRead
                ? Colors.grey
                : Colors.black54, // Change timestamp color for read/unread
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
            vertical: 8, horizontal: 12), // Compact padding
      ),
    );
  }
}
