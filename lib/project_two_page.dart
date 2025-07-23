import 'package:flutter/material.dart';

class ProjectTwoPage extends StatefulWidget {
  const ProjectTwoPage({super.key});

  @override
  State<ProjectTwoPage> createState() => _ProjectTwoPageState();
}

class _ProjectTwoPageState extends State<ProjectTwoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome user!'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("I am project_1", style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.w500,
              fontSize: 25
          ),),
        ],
      ),
    );
  }
}
