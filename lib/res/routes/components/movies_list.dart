import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobies/data/response/status.dart';
import 'package:mobies/models/movies_model/movies_model.dart';
import 'package:mobies/view/movies_details_view.dart';
import 'package:shimmer/shimmer.dart';

class MoviesList extends StatelessWidget {
  final RxList<MoviesModel> moviesLs;
  final Rx<Status> staus;

  const MoviesList({super.key, required this.moviesLs, required this.staus});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (staus.value == Status.loading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (moviesLs.isEmpty) {
        return const Center(
          child: Text('No data Found!'),
        );
      } else {
        return GridView.builder(
            itemCount: moviesLs.length,
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
              var data = moviesLs[index];
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
                      rating: double.parse(data.rating ?? '1'),
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
