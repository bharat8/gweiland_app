import 'package:equatable/equatable.dart';

class GlobalHeaders extends Equatable {
  static Headers headers = Headers.empty();

  @override
  List<Object> get props => [headers];
}

class Headers extends Equatable {
  const Headers({
    required this.token,
    this.ipV4 = '',
    this.ipV6 = '',
  });

  factory Headers.empty() => const Headers(
        token: '',
      );

  final String token;
  final String ipV4;
  final String ipV6;

  Headers copyWith({
    String? token,
    String? ipV4,
    String? ipV6,
  }) {
    return Headers(
      token: token ?? this.token,
      ipV4: ipV4 ?? this.ipV4,
      ipV6: ipV6 ?? this.ipV6,
    );
  }

  @override
  List<Object> get props => [token, ipV4, ipV6];

  @override
  String toString() => 'Headers(token: $token, ipV4: $ipV4, ipV6: $ipV6)';
}
