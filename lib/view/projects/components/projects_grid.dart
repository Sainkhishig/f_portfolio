import 'package:flutter/material.dart';
import 'package:afen_portfolio/view/projects/components/project_info.dart';
import 'package:get/get.dart';
import '../../../common/enum/common_enum.dart';
import '../../../model/project_model.dart';
import '../../../res/constants.dart';
import '../../../view model/getx_controllers/projects_controller.dart';
import 'dart:convert';

class ProjectGrid extends StatelessWidget {
  final int crossAxisCount;
  final double ratio;
  ProjectGrid({super.key, this.crossAxisCount = 3, this.ratio = 1.3});
  final controller = Get.put(ProjectController());
  List lstAllProj = [];
  @override
  Widget build(BuildContext context) {
    var lst = json.decode(listProj);
    for (var element in lst) {
      // element.fromJson(Map<String, dynamic> json) => _FromJson(json);

      lstAllProj.add(Project.fromJson(element));
    }
    print("lstAllProj:${lstAllProj.length}");
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      itemCount: lstAllProj.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount, childAspectRatio: ratio),
      itemBuilder: (context, index) {
        return Obx(() => AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.symmetric(
                vertical: defaultPadding, horizontal: defaultPadding),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: const LinearGradient(colors: [
                  Colors.teal,
                  Colors.cyan,
                ]),
                boxShadow: [
                  BoxShadow(
                    color: Colors.cyan,
                    offset: const Offset(-2, 0),
                    blurRadius: controller.hovers[index] ? 20 : 10,
                  ),
                  BoxShadow(
                    color: Colors.teal,
                    offset: const Offset(2, 0),
                    blurRadius: controller.hovers[index] ? 20 : 10,
                  ),
                ]),
            child: ProjectStack(
              index: index,
              project: lstAllProj[index],
            )));
      },
    );
  }
}
