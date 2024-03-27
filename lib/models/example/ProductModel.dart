import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:market3t/services/api_servies.dart';

part 'ProductModel.freezed.dart';
part 'ProductModel.g.dart';

@freezed
class ProductModel with _$ProductModel {
  factory ProductModel({
    required int id,
    required String name,
    required String image,
    required String price,
    required String discount,
    required String discountPrice,
    required String brand,
    String? description,
    // CategoryModel? category,
    List<String>? colors,
    List<String>? sizes,
    List<String>? images,
    String? rating,
    String? model,
    String? weight,

  }) = _ProductModel;

  factory ProductModel.fromJson(JSON json) => _$ProductModelFromJson(json);
}
