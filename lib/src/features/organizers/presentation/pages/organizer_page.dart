import 'package:flutter/material.dart';

class OrganizerPage extends StatefulWidget {
  const OrganizerPage({super.key});

  @override
  State<OrganizerPage> createState() => _OrganizerPageState();
}

class _OrganizerPageState extends State<OrganizerPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          color: Colors.red,
          child: const Center(
            child: Text("Organizer Page"),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.blue,
            child: const Center(
              child: Text("Organizer Page Content"),
            ),
          ),
        ),
      ],
    );
  }
}
