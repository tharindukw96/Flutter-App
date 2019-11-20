import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'Movie.dart';

class API{

  final String base_url = "https://yts.ae/api/v2/list_movies.json?";
  String genre;
  int actionPage = 1;

  API(this.genre);

  Future<List> getMovies() async{
    Response response = await get(base_url+'genre=$genre&sort_by=rating&page=$actionPage');
    Map data = jsonDecode(response.body);

    List movieList = data['data']['movies'];
    //print(actionPage);
    actionPage+=1;
    return movieList;
  }

}