import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:tasks/src/data/contracts/model_contract.dart';

class TaskModel implements ModelContract {
  int _id;
  String _title;
  int _done;
  int _projectId;
  String _note;
  int _important;
  DateTime _createdDate;
  DateTime _dueDate;

  int get id => this._id;
  String get title => this._title;
  bool get done => this._done == 1 ? true : false;
  int get projectId => this._projectId;
  String get note => this._note;
  bool get important => this._important == 1 ? true : false;
  DateTime get createdDate => this._createdDate;
  DateTime get dueDate => this._dueDate;

  set title(String title) {
    this._title = title;
  }

  set done(bool done) {
    this._done = done ? 1 : 0;
  }

  set projectId(int id) {
    this._projectId = id;
  }

  set note(String note) {
    this._note = note;
  }

  set important(bool important) {
    this._important = important ? 1 : 0;
  }

  set dueDate(DateTime date) {
    this._dueDate = date;
  }

  /// Constructor of a task model object.
  TaskModel({
    int id,
    @required String title,
    @required bool done,
    @required int projectId,
    String note,
    bool important,
    @required DateTime createdDate,
    DateTime dueDate
  }) {
    this._id = id;
    this._title = title;
    this._done = done ? 1 : 0;
    this._projectId = projectId;
    this._note = note;
    this._important = important ? 1 : 0;
    this._createdDate = createdDate;
    this._dueDate = dueDate;
  }

  /// Constructor of a task model object from a Map object.
  TaskModel.from(Map<String, dynamic> object) {
    this._id = object['id'];
    this._title = object['title'];
    this._done = object['done'];
    this._projectId = object['project_id'];
    this._note = object['note'];
    this._important = object['important'];
    this._createdDate = DateTime.parse(object['created_date']);
    this._dueDate = object['due_date'] != null ? DateTime.parse(object['due_date']) : null;
  }

  /// Returns a map object to representation of this object.
  Map<String, dynamic> toMap() {
    var object = Map<String, dynamic>();
    object['id'] = this._id;
    object['title'] = this._title;
    object['done'] = this._done;
    object['project_id'] = this._projectId;
    object['note'] = this._note;
    object['important'] = this._important;
    object['created_date'] = this._createdDate.toString();
    object['due_date'] = this.dueDate != null ? DateFormat('yyyy-MM-dd').format(this._dueDate) : null;
    return object;
  }
}
