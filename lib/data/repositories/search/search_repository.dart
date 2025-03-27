import 'dart:convert';

import 'package:flutter_itunes_search/data/services/remote/api_endpoints.dart';
import 'package:flutter_itunes_search/data/services/remote/app_api_client.dart';

import '../../services/domain/base_response.dart';
import '../../services/domain/search_result_response.dart';

class SearchRepository {
  final AppApiClient _apiClient;

  SearchRepository({required AppApiClient apiClient}) : _apiClient = apiClient;

  Future<BaseResponse<MusicSearchResult>> search({
    required String query,
  }) async {
    try {
      final response = await _apiClient.get(
        endpoint: ApiEndpoints.search,
        queryParameters: {'term': query, 'entity': 'musicTrack'},
      );

      final MusicSearchResult searchResult = MusicSearchResult.fromJson(
        jsonDecode(response.data),
      );

      return BaseResponse.complete(searchResult);
    } catch (e) {
      // Handle error in more specific way
      print('Krishna is error ${e}');
      return BaseResponse.error<MusicSearchResult>(statusCode: 500);
    }
  }
}
