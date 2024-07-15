import 'package:dio/dio.dart';
import 'package:starwars/model/model.dart';

class ServiceApi {
  final Dio _dio = Dio();
  final String _baseUri = 'https://swapi.dev/api';

    Future<List<Film>> getFilm() async {
    try{
      final response = await _dio.get('$_baseUri/films/');
      List jsonResponse = response.data['results'];
      return jsonResponse.map((film)=> Film.fromJson(film)).toList();

    }catch (error){
      throw Exception('Falha ao carregar filmes: $error');
    }
  }
}