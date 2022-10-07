import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:music_app/data/models/tracks_model.dart';

abstract class RemoteDatasource {
  Future<List<TracksModel>> getTracks();
}

class RemoteDatasourceImpl implements RemoteDatasource {
  static const Map<String, String> _headers = {
    'x-rapidapi-key': '4adc87ac79msh075f9c56800a0e1p1097b1jsneba2c4d34221',
    'x-rapidapi-host': 'spotify23.p.rapidapi.com',
  };

  @override
  Future<List<TracksModel>> getTracks() async {
    Uri uri = Uri.parse('https://spotify23.p.rapidapi.com/tracks/');
    final response = await http.get(uri, headers: _headers);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['tracks'];
      return jsonResponse.map((e) => TracksModel.fromJson(e)).toList();
    } else {
      throw Exception('Request Error: ${response.statusCode}');
    }
  }
}
