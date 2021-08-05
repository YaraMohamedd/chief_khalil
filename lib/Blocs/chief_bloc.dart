
import 'package:chief_khalil/Models/cheif_model.dart';
import 'package:chief_khalil/Repositories/chief_repository.dart';
import 'package:rxdart/rxdart.dart';
class ChiefBlock{
  final _repository = Repository();
  final _chiefFetcher = PublishSubject<Cheif>();

  Stream<Cheif> get topChiefs => _chiefFetcher.stream;
  getTopChiefs() async {
    Cheif data = await _repository.getTopChiefs();
    _chiefFetcher.sink.add(data);
  }
  dispose() {
    _chiefFetcher.close();
  }
}
final bloc = ChiefBlock();