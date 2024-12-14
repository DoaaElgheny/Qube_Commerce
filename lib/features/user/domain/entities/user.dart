import 'package:equatable/equatable.dart';

import 'details.dart';

base class User extends Equatable {
  const User({
    required this.accessToken,
    required this.details,
  });

  final String accessToken;
  final UserDetails details;

  @override
  List<Object> get props {
    return <Object>[
      accessToken,
      details,
    ];
  }
}
