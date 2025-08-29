import 'package:freezed_annotation/freezed_annotation.dart';
import 'product_info_dto.dart';

part 'view_module_dto.freezed.dart';
part 'view_module_dto.g.dart';

@freezed
abstract class ViewModuleDto with _$ViewModuleDto {
  const factory ViewModuleDto({
    @Default('') String type,
    @Default('') String title,
    @Default('') String subtitle,
    @Default('') String imageUrl,
    @Default(-1) int time,
    @Default(<ProductInfoDto>[]) List<ProductInfoDto> products,
    @Default(<String>[]) List<String> tabs,
  }) = _ViewModuleDto;

  factory ViewModuleDto.fromJson(Map<String, dynamic> json) => _$ViewModuleDtoFromJson(json);
}
