import 'package:flutter/material.dart';
import 'package:afen_portfolio/view/projects/components/project_link.dart';

import '../../../model/project_model.dart';
import '../../../res/constants.dart';
import '../../../view model/responsive.dart';
import 'package:afen_portfolio/core/LocaleCont.dart';
import 'package:get/get.dart';

class ProjectDetail extends StatelessWidget {
  final int index;
  final Project project;
  const ProjectDetail({super.key, required this.index, required this.project});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ...project.skills
                .split(",")
                .map((e) => Container(
                      // margin: const EdgeInsets.all(5.0),
                      // padding: const EdgeInsets.only(left: 3.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.teal)),
                      child: Text("$e",
                          style: const TextStyle(
                            fontSize: 9,
                            color: Colors.white,
                          )),
                    ))
                .toList()
          ],
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Text(
            Get.find<LocaleCont>().locale.languageCode == "mn"
                ? project.nameMn
                : Get.find<LocaleCont>().locale.languageCode == "ja"
                    ? project.nameJP
                    : project.name,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Responsive.isMobile(context)
            ? const SizedBox(
                height: defaultPadding / 2,
              )
            : const SizedBox(
                height: defaultPadding - 10,
              ),
        Text(
          Get.find<LocaleCont>().locale.languageCode == "mn"
              ? project.descriptionMn
              : Get.find<LocaleCont>().locale.languageCode == "ja"
                  ? project.descriptionJP
                  : project.description,
          style: const TextStyle(color: Colors.grey, height: 1.5),
          maxLines: size.width > 700 && size.width < 750
              ? 5
              : size.width < 470
                  ? 2
                  : size.width > 600 && size.width < 700
                      ? 6
                      : size.width > 900 && size.width < 1060
                          ? 6
                          : 5,
          overflow: TextOverflow.ellipsis,
        ),
        const Spacer(),
        ProjectLinks(
          index: index,
          project: project,
        ),
        const SizedBox(
          height: defaultPadding / 2,
        ),
      ],
    );
  }
}
