import 'package:favours_app/models/friend_model.dart';

class Favor {
  final String uuid;
  final String description;
  final DateTime dueDate;
  bool? accepted;
  final DateTime? completed;
  final Friend friend;

  Favor({
    required this.uuid,
    required this.description,
    required this.dueDate,
    this.accepted,
    this.completed,
    required this.friend,
  });

  Favor copyWith({
    String? uuid,
    String? description,
    DateTime? dueDate,
    bool? accepted,
    DateTime? completed,
    Friend? friend,
  }) {
    return Favor(
      uuid: uuid ?? this.uuid,
      description: description ?? this.description,
      dueDate: dueDate ?? this.dueDate,
      accepted: accepted ?? this.accepted,
      completed: completed ?? this.completed,
      friend: friend ?? this.friend,
    );
  }

  set setAccepted(bool value) => accepted = value;

  /// returns true if the favor is active ( the user is doing it )
  get isDoing => accepted == true && completed == null;

  /// returns true if the user has not answered the request yet
  get isRequested => accepted == null;

  /// returns true if the favor is already completed
  get isCompleted => completed != null;

  /// returns true if the favor was not accepted
  get isRefused => accepted == false;
}
