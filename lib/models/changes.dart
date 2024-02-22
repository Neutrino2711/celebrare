// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:celebrare_assignment/providers/textstate.dart';

class Changes {
  bool created;
  TextModel? oldModel;
  TextModel? newModel;
  Changes({
    required this.created,
    required this.oldModel,
    required this.newModel,
  });

  Changes copyWith({
    bool? created,
    TextModel? oldModel,
    TextModel? newModel,
  }) {
    return Changes(
      created: created ?? this.created,
      oldModel: oldModel ?? this.oldModel,
      newModel: newModel?? this.newModel,
    );
  }


  @override
  String toString() => 'Changes(created: $created, oldModel: $oldModel)';

  @override
  bool operator ==(covariant Changes other) {
    if (identical(this, other)) return true;
  
    return 
      other.created == created &&
      other.oldModel == oldModel;
  }

  @override
  int get hashCode => created.hashCode ^ oldModel.hashCode;
}
