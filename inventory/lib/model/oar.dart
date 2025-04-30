import 'package:inventory/model/boat.dart';
import 'package:inventory/model/count_item.dart';

class Oar extends CountItem{

  Gender gender;

  Oar({
    required this.gender,
    required super.type,
    required super.location,
    required super.count,
    required super.name,
  });
  

  @override
  Map<String, dynamic> toMap() {
    // TODO: implement toMap
    throw UnimplementedError();
  }
  


}