import 'dart:convert';
import 'dart:io';

import 'package:easy_travel/features/home/infrastructure/remote/destination_dto.dart';
import 'package:http/http.dart' as http;

class DestinationApi {
  final String url =
      'https://destinationapp-h4e8dvace3fqffbb.eastus-01.azurewebsites.net/api/destinations';

  Future<List<DestinationDto>> getDestinations() async {
    final Uri uri = Uri.parse(url);

    final http.Response response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      final Map<String, dynamic> map = jsonDecode(response.body);

      final List jsons = map['results'];

      return jsons.map((e) => DestinationDto.fromJson(e)).toList();
    }

    throw Exception('Failed to load destinations.');
  }
}
