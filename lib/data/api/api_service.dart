import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final http.Client client = http.Client();

  static const String baseUrl = 'https://valorant-api.com/v1';

  Future<List<dynamic>> getAgentsList() async {
    final response = await client.get(Uri.parse('$baseUrl/agents?isPlayableCharacter=true'));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data['data'];
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<Map<String, dynamic>> getAgentsByID(String id) async {
    final response = await client.get(Uri.parse('$baseUrl/agents/$id'));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data['data'];
    } else {
      throw Exception('Failed to load data');
    }
  }
  
  Future<List<dynamic>> getBundlesList() async {
    final response = await client.get(Uri.parse('$baseUrl/bundles'));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data['data'];
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<Map<String, dynamic>> getBundlesByID(String id) async {
    final response = await client.get(Uri.parse('$baseUrl/bundles/$id'));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data['data'];
    } else {
      throw Exception('Failed to load data');
    }
  }
}