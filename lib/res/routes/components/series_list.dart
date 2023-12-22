import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobies/data/response/status.dart';
import 'package:mobies/models/series_list_model/series_list_model.dart';
import 'package:mobies/view/movies_details_view.dart';
import 'package:shimmer/shimmer.dart';

class SeriesList extends StatelessWidget {
  final RxList<SeriesListModel> seriesLs;
  final Rx<Status> staus;

  const SeriesList({super.key, required this.staus, required this.seriesLs});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (staus.value == Status.loading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (seriesLs.isEmpty) {
        return const Center(
          child: Text('No data Found!'),
        );
      } else {
        return GridView.builder(
            itemCount: seriesLs.length,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 10,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: .7,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              var data = seriesLs[index];
              return InkWell(
                onTap: () {
                  Get.to(
                    () => MoviesDetailsView(
                      title: data.title ?? '',
                      imageUrl: data.image ??
                          'https://i.pinimg.com/564x/16/cd/36/16cd36c527fb15dd914dc84d4dc039a5.jpg',
                      desc: data.description ?? '',
                      year: data.year.toString(),
                      type: data.genre ?? [],
                      rating: data.rating ?? 1,
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImage(
                    imageUrl: data.image ??
                        'https://i.pinimg.com/564x/16/cd/36/16cd36c527fb15dd914dc84d4dc039a5.jpg',
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.black.withOpacity(0.2),
                      highlightColor: Colors.white54,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              );
            });
      }
    });
  }
}
