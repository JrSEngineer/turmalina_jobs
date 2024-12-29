// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:turmalina_jobs/src/app/modules/job_vacancy_module/entities/job_vacancy.dart';
import 'package:turmalina_jobs/src/shared/widgets/general_header_widget/general_header_image_widget.dart';
import 'package:turmalina_jobs/src/shared/widgets/general_header_widget/general_header_widget.dart';

class JobVacancyCard extends StatelessWidget {
  const JobVacancyCard({
    Key? key,
    required this.jobVacancy,
    required this.onTap,
    this.radius,
    this.padding,
  }) : super(key: key);

  final JobVacancy jobVacancy;
  final Function() onTap;
  final double? radius;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    const componentImageRightMargin = 12.0;

    const componentImageSize = 72.0;

    const componentImageRadius = 8.0;

    const cardDivider = 24.0;

    const image = 'https://images.pexels.com/photos/93820/pexels-photo-93820.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';

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
                image: const GeneralHeaderImageWIdget(
                  componentImageSize: componentImageSize,
                  componentImageRadius: componentImageRadius,
                  componentImageRightMargin: componentImageRightMargin,
                  imageUrl: image,
                ),
                title: Text(
                  jobVacancy.detail.title,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                subTitle: Text(
                  jobVacancy.postOwner.name,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                ),
              ),
              const SizedBox(height: cardDivider),
              Text(jobVacancy.detail.description, style: Theme.of(context).textTheme.bodyLarge)
            ],
          ),
        ),
      ),
    );
  }
}
