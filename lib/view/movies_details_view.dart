import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class MoviesDetailsView extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String year;
  final String desc;
  final List type;
  final double rating;
  const MoviesDetailsView({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.year,
    required this.desc,
    required this.type,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        child: Stack(
          children: [
            CachedNetworkImage(
              width: Get.width,
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.black.withOpacity(0.2),
                highlightColor: Colors.white54,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.black54,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Positioned(
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  width: Get.width,
                  height: Get.height * .52,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.4),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.7),
                        offset: const Offset(0,
                            -25), // Negative offset to place the shadow above the top
                        blurRadius: 10,
                        spreadRadius: 25,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: theme.textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      const Gap(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            year,
                            style: theme.textTheme.bodyLarge!.copyWith(
                              color:
                                  theme.colorScheme.onSurface.withOpacity(.5),
                            ),
                          ),
                          RatingBar.builder(
                            initialRating: rating,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 10,
                            itemSize: 22,
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {},
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          ...type.map((e) {
                            return Text(
                              '$e, ',
                              style: theme.textTheme.bodyLarge!.copyWith(
                                color:
                                    theme.colorScheme.onSurface.withOpacity(.5),
                              ),
                            );
                          })
                        ],
                      ),
                      const Gap(10),
                      Text(
                        desc,
                        style: theme.textTheme.bodyLarge!.copyWith(
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
