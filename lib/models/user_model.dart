import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_model.freezed.dart';

@freezed
sealed class UserModel with _$UserModel {
  factory UserModel({
    String? username,
    String? password,
    @Default(true) bool loading,
    @Default(false) bool isValid,
    @Default(false) bool initialLoad,
  }) = _UserModel;
}
