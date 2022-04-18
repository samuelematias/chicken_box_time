import 'package:equatable/equatable.dart';

/// This class associated a [name] to a given [value].
class Named<T> extends Equatable {
  /// Creates a new instance of [Named].
  const Named(
    this.name,
    this.value,
  );

  /// Receive the [name] as [String].
  final String name;

  /// Receive the [value] as [T]/Generic type.
  final T value;

  @override
  List<Object?> get props => [value];

  @override
  String toString() => '<$name>($value)';
}

/// A collection of [T]/Generic type class/type extensions,
/// focus on [Equatable] scope.
extension NamedExtension<T> on T {
  /// Extension to get [name] from the class parameters,
  /// for the Equatable.
  Named<T> named(String name) => Named<T>(name, this);
}
