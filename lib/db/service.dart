import 'package:grocery101/model/Item.dart';
import 'localdb.dart';

class Service {
  Repo? _repo;

  Service() {
    _repo = Repo();
  }

  saveAsbeza(Item item) async {
    return await _repo!.insertData('history', item.toJson());
  }

  readAsbeza() async {
    return await _repo!.readData('history');
  }

  updateAsbeza(Item item) async {
    return await _repo!.updateData('history', item.toJson());
  }

  deleteAsbeza(dispatchId) async {
    return await _repo!.deleteData('history', dispatchId);
  }

  wipeDate() async {
    await _repo!.deleteAllData('history');
  }
}