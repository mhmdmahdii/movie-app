import 'dart:convert';
import 'package:movies_app/models/category_movie.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/models/filtred_movies.dart';
import '../../components/constant.dart';

class ApiManager{

  static Future <CategoryMovie> getCategory() async {
    var url = Uri.https(BASEURL, '/3/genre/movie/list', {
      "api_key": APIKEY,
    });

    try {
      
      var response = await http.get(url);

      var bodyCategory = response.body;
      
      var json = jsonDecode(bodyCategory);

      return  CategoryMovie.fromJson(json);
    } catch (e) {

      throw e;
    }
  }


  static Future <FiltredMovies> getFiltered(String genres) async {
    var url = Uri.https(BASEURL, '/3/discover/movie', {
      "api_key": APIKEY,
      "with_genres": genres,
    });

    try {
      
      var response = await http.get(url);

      var bodyCategory = response.body;
      
      var json = jsonDecode(bodyCategory);

      return  FiltredMovies.fromJson(json);
    } catch (e) {

      throw e;
    }
  }
}