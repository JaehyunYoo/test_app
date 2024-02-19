// ignore_for_file: library_private_types_in_public_api

class RoutePath {
  static _RoutePathObjectValue root =
      _RoutePathObjectValue(path: '/root', name: 's_root');

  static _RoutePathObjectValue splash =
      _RoutePathObjectValue(path: '/splash', name: 's_splash');

  static _RoutePathObjectValue signUpIn =
      _RoutePathObjectValue(path: '/signInUp', name: 'signInUp');
}

class _RoutePathObjectValue {
  final String path;
  final String name;
  _RoutePathObjectValue({
    required this.path,
    required this.name,
  });
}
