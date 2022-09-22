class Routes {
  /// Current value is /
  static const String HOME = '/';
}

extension RoutesExtension on String {
  /// Remove all the routes until the actual one.
  ///
  /// Ex:
  /// The route **/app_content/home** returns **/home**.
  ///
  /// Its useful to declare the routes on the modules.
  String sanetize() {
    return substring(lastIndexOf('/'), length);
  }

  /// Get the current route name.
  ///
  /// Ex:
  /// The route **/app_content/home** returns **home**.
  ///
  /// Its used in some places that has navigation inside the same module.
  String getCurrentRouteName() {
    return sanetize().replaceFirst('/', '');
  }
}
