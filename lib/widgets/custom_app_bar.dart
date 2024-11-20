import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Image.asset(
            "assets/logo.png",
            width: 70,
            height:70,

            errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
          ),
          const SizedBox(width: 20),
          Text(title),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.person), // Profile icon

          onPressed: () {
            // Navigate to the profile screen
            Navigator.pushNamed(context, '/profile');
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}