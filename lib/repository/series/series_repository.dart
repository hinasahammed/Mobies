import 'package:mobies/data/network/network_api_service.dart';
import 'package:mobies/res/app_url/app_url.dart';

class SeriesRepository{
   final _api = NetworkApiService();

  Future fetchSeries() async {
    Map<String, String> headers = {
      'X-RapidAPI-Key': 'c9bc77b6femsh4e547edb0e3004cp10b70cjsn285188c224dd',
      'X-RapidAPI-Host': 'imdb-top-100-movies.p.rapidapi.com'
    };
    var result = await _api.getApi(AppUrl.series, headers);
    return result;
  }
}