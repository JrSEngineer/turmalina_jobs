// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/entities/job_vacancy.dart';
import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/enums/job_vacancy_status.dart';
import 'package:turmalina_jobs/src/shared/widgets/app_tag_widget.dart';
import 'package:turmalina_jobs/src/shared/widgets/general_header_widget/general_header_image_widget.dart';
import 'package:turmalina_jobs/src/shared/widgets/general_header_widget/general_header_widget.dart';

class JobVacancyCard extends StatelessWidget {
  const JobVacancyCard({
    Key? key,
    required this.jobVacancy,
    required this.onTap,
    this.radius,
    this.padding,
    this.componentImageRightMargin,
    this.componentImageSize,
    this.componentImageRadius,
    this.cardDivider,
    this.postOwnerImage,
    this.titleStyle,
    this.subTitleStyle,
    this.extendedMode = false,
    this.widgets = const [],
  }) : super(key: key);

  final JobVacancy jobVacancy;
  final Function()? onTap;
  final double? radius;
  final double? padding;
  final double? componentImageRightMargin;
  final double? componentImageSize;
  final double? componentImageRadius;
  final double? cardDivider;
  final String? postOwnerImage;
  final TextStyle? titleStyle;
  final TextStyle? subTitleStyle;
  final bool? extendedMode;
  final List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 8,
        color: Theme.of(context).colorScheme.onPrimary,
        surfaceTintColor: Theme.of(context).colorScheme.onPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 0),
        ),
        child: Padding(
          padding: EdgeInsets.all(padding ?? 0),
          child: Column(
            children: [
              GeneralHeaderWidget(
                image: GeneralHeaderImageWIdget(
                  componentImageSize: componentImageSize ?? 1,
                  componentImageRadius: componentImageRadius ?? 1,
                  componentImageRightMargin: componentImageRightMargin ?? 1,
                  imageUrl: postOwnerImage,
                ),
                title: Text(
                  jobVacancy.detail.title,
                  style: titleStyle,
                ),
                subTitle: Text(
                  jobVacancy.postOwner.name,
                  style: subTitleStyle,
                ),
                widgets: [
                  AppTagWidget(
                    text: jobVacancy.detail.vacancyStatus == JobVacancyStatus.available ? 'Aberta' : 'Fechada',
                    style: Theme.of(context).textTheme.bodyLarge,
                    padding: 6,
                    radius: 36,
                    borderColor: Theme.of(context).colorScheme.primary,
                  ),
                ],
              ),
              SizedBox(height: cardDivider ?? 10),
              Text(jobVacancy.detail.description, style: Theme.of(context).textTheme.bodyLarge),
              if (extendedMode!)
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: cardDivider ?? 10),
                      ...widgets,
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
