import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobies/res/routes/components/movies_list.dart';
import 'package:mobies/res/routes/components/series_list.dart';
import 'package:mobies/view_model/controller/home/home_controller.dart';
import 'package:mobies/view_model/controller/series/series_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final homeController = Get.put(HomeController());
  final seriesController = Get.put(SeriesController());

  @override
  void initState() {
    super.initState();
    homeController.getMoviesData();
    seriesController.getSeriesData();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('home_appBar'.tr),
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'tab_movies'.tr,
              ),
              Tab(
                text: 'tab_series'.tr,
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            MoviesList(
              moviesLs: homeController.movies,
              staus: homeController.requestStatus,
            ),
            SeriesList(
              staus: seriesController.requestStatus,
              seriesLs: seriesController.series,
            ),
          ],
        ),
      ),
    );
  }
}
