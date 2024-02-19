// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

class Result<SuccessType, FailureType> {
  bool get isFailure => this is _Failure<SuccessType, FailureType>;

  bool get isSuccess => this is _Success<SuccessType, FailureType>;

  static _Success<SuccessType, FailureType> success<SuccessType, FailureType>(
      [SuccessType? data]) {
    return _Success<SuccessType, FailureType>(data);
  }

  static _Failure<S, F> failure<S, F>([F? data]) {
    return _Failure<S, F>(data);
  }

  // sync
  Result runSuccess(FutureOr<void> Function(SuccessType data) fun) {
    _runSuccess(fun);
    return this;
  }

  Result runFailure(FutureOr<void> Function(FailureType data) fun) {
    _runFailure(fun);
    return this;
  }

  // async
  FutureOr<Result> runSuccessAsync(
      FutureOr<void> Function(SuccessType data) fun) async {
    await _runSuccess(fun);
    return this;
  }

  FutureOr<Result> runFailureAsync(
      FutureOr<void> Function(FailureType data) fun) async {
    await _runFailure(fun);
    return this;
  }

  Future<void> _runSuccess(
      FutureOr<void> Function(SuccessType data) fun) async {
    if (isSuccess) {
      if (!_isSuccessDataExist) {
        await fun(null as SuccessType);
      } else {
        await fun(successData);
      }
    }
  }

  Future<void> _runFailure(
      FutureOr<void> Function(FailureType error) fun) async {
    if (isFailure) {
      if (!_isFailureDataExist) {
        await fun(null as FailureType);
      } else {
        await fun(failureData);
      }
    }
  }

  ///
  /// success data and failure data
  ///
  FailureType get failureData {
    if (isFailure) {
      final data = (this as _Failure<SuccessType, FailureType>).data;
      if (data == null) {
        throw const FormatException('Failure data not exist');
      }
      return data;
    }
    throw const FormatException('This is not Failure type');
  }

  SuccessType get successData {
    if (isSuccess) {
      final data = (this as _Success<SuccessType, FailureType>).data;

      if (data == null) {
        throw const FormatException('Success data not exist');
      }
      return data;
    }

    throw const FormatException('This is not Success type');
  }

  ///
  /// is success data and failure data Exist?
  ///
  bool get _isSuccessDataExist {
    if ((this as _Success<SuccessType, FailureType>).data == null) {
      return false;
    }
    return true;
  }

  bool get _isFailureDataExist {
    if ((this as _Failure<SuccessType, FailureType>).data == null) {
      return false;
    }
    return true;
  }
}

///
/// Success Data
///
class _Success<SuccessType, FailureType>
    extends Result<SuccessType, FailureType> {
  final SuccessType? data;
  _Success(this.data);
}

///
/// Failure Data
///
class _Failure<SuccessType, FailureType>
    extends Result<SuccessType, FailureType> {
  final FailureType? data;
  _Failure(this.data);
}
