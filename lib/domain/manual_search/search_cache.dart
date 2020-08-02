import 'package:foodprint/domain/manual_search/autocomplete_result_entity.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class AutocompleteSearchCache {
  final _cache = <String, List<AutocompleteResultEntity>>{};

  List<AutocompleteResultEntity> get(String term) => _cache[term];

  void set(String term, List<AutocompleteResultEntity> result) =>
      _cache[term] = result;

  bool contains(String term) => _cache.containsKey(term);

  void remove(String term) => _cache.remove(term);
}
