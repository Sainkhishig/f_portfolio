import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../model/project_model.dart';

class ProjectLinks extends StatelessWidget {
  final int index;
  final Project project;
  const ProjectLinks({super.key, required this.index, required this.project});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            // const Text('Check on Github',
            //     style: TextStyle(color: Colors.white),
            //     overflow: TextOverflow.ellipsis),
            IconButton(
                onPressed: () async {
                  await launchUrl(Uri.parse("https://hishig-toli.com/"));
                  // launchUrl(Uri.parse(project.link));
                },
                // color: Colors.white,
                icon: SvgPicture.asset('assets/icons/dribble.svg')),
          ],
        ),
        IconButton(
            onPressed: () {
              launchUrl(Uri.parse(project.link));
            },
            icon: SvgPicture.asset('assets/icons/github.svg')),
        const Spacer(),
        TextButton(
            onPressed: () {
              launchUrl(Uri.parse(project.link));
            },
            child: Text(
              "${project.date ?? ""}",
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                  fontSize: 10),
            ))
      ],
    );
  }
}
