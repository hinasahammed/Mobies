import 'package:get/get.dart';
import 'package:mobies/data/response/status.dart';
import 'package:mobies/models/series_list_model/series_list_model.dart';
import 'package:mobies/repository/series/series_repository.dart';
import 'package:mobies/utils/utils.dart';

class SeriesController extends GetxController {
  final _repo = SeriesRepository();
  final requestStatus = Status.loading.obs;
  RxList<SeriesListModel> series = <SeriesListModel>[].obs;

  void setRequestStatus(Status status) {
    requestStatus.value = status;
  }

  void getSeriesData() async {
    setRequestStatus(Status.loading);

    await _repo.fetchSeries().then((value) {
      setRequestStatus(Status.completed);
      for (Map<String, dynamic> i in value) {
        series.add(SeriesListModel.fromJson(i));
      }
    }).onError((error, stackTrace) {
      setRequestStatus(Status.error);
      Utils.showSnackbar('Error', error.toString());
    });
  }
}
