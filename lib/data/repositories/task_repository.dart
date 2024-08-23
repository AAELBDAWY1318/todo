import 'package:hive/hive.dart';
import 'package:try_again/data/models/task.dart';

class TaskRepository {
  Future<Box> openBox({required String boxName}) async {
    return await Hive.openBox(boxName);
  }

  Future<void> addToBox({required String boxName, required Task task}) async {
    Map<String, String> data = task.toMap();
    var box = await openBox(boxName: boxName);
    box.add(data);
  }

  Future<List> getAllTasks({required String boxName}) async {
    var box = await openBox(boxName: boxName);
    box.toMap().entries.toList();
    return box.toMap().entries.toList();
  }

  Future<void> delete({required int index, required String boxName}) async {
    var box = await openBox(boxName: boxName);
    box.deleteAt(index);
  }

  Future<void> moveTask({
    required String sourceBox,
    required String destinationBox,
    required int index,
  }) async {
    var source = await openBox(boxName: sourceBox);
    var destination = await openBox(boxName: destinationBox);

    // hold the value
    var movedValue = source.getAt(index);
    source.deleteAt(index);

    if (movedValue != null) {
      await destination.add(movedValue);
    }
  }
}
