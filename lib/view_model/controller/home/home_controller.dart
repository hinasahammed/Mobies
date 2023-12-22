import 'package:get/get.dart';
import 'package:mobies/data/response/status.dart';
import 'package:mobies/models/movies_model/movies_model.dart';
import 'package:mobies/repository/movies/movies_repository.dart';
import 'package:mobies/utils/utils.dart';

class HomeController extends GetxController {
  final _repo = MoviesRepository();
  final requestStatus = Status.loading.obs;
  RxList<MoviesModel> movies = <MoviesModel>[].obs;

  void setRequestStatus(Status status) {
    requestStatus.value = status;
  }


  void getMoviesData() async {
    setRequestStatus(Status.loading);

    await _repo.fetchMovies().then((value) {
      setRequestStatus(Status.completed);
      for (Map<String, dynamic> i in value) {
        movies.add(MoviesModel.fromJson(i));
      }
    }).onError((error, stackTrace) {
      setRequestStatus(Status.error);
      Utils.showSnackbar('Error', error.toString());
    });
  }
}
