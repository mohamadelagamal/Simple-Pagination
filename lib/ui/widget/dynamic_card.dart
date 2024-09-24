import 'package:flutter/material.dart';

/// A stateless widget that represents a dynamic card with customizable properties.
class DynamicCard extends StatelessWidget {
  /// The name to be displayed as the title of the card.
  final String name;

  /// The URL to be displayed as the subtitle of the card.
  final String url;

  /// The icon to be displayed in the leading position of the card.
  final IconData icon;

  /// The color of the icon.
  final Color iconColor;

  /// The background color of the icon's circle avatar.
  final Color backgroundColor;

  /// The text style for the title.
  final TextStyle titleStyle;

  /// The text style for the subtitle.
  final TextStyle subtitleStyle;

  /// Creates a [DynamicCard] widget.
  const DynamicCard({
    required this.name,
    required this.url,
    this.icon = Icons.emoji_emotions,
    this.iconColor = Colors.white,
    this.backgroundColor = Colors.teal,
    this.titleStyle = const TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.bold,
    ),
    this.subtitleStyle = const TextStyle(),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: backgroundColor,
          child: Icon(icon, color: iconColor),
        ),
        title: Text(
          name,
          style: titleStyle,
        ),
        subtitle: Text(
          url,
          style: subtitleStyle,
        ),
      ),
    );
  }
}