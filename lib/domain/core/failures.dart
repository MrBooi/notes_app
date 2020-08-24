import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.exceedingLength(
      {@required T failledValue, @required int max}) = ExceedingLength<T>;
  const factory ValueFailure.empty({@required T failledValue}) = Empty<T>;
  const factory ValueFailure.multiline({@required T failledValue}) =
      Multiline<T>;
  const factory ValueFailure.listToolong(
      {@required T failledValue, @required int max}) = ListTooLong<T>;
  const factory ValueFailure.invalidEmail({@required T failledValue}) =
      InvalidEmail<T>;
  const factory ValueFailure.shortPassword({@required T failledValue}) =
      ShortPassword<T>;
}
