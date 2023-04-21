import 'package:flutter/material.dart';

import '../../../../config/config.dart';

class HomeComposedScreen extends StatefulWidget {
  const HomeComposedScreen({super.key});

  @override
  State<HomeComposedScreen> createState() => _HomeComposedScreenState();
}

class _HomeComposedScreenState extends State<HomeComposedScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      color: Theme.of(context).scaffoldBackgroundColor,
    );
  }
}
