import 'package:equatable/equatable.dart';

enum RoleType { child, adult, senior }

class RoleView extends Equatable {
  final RoleType role;

  const RoleView(this.role);

  @override
  List<Object?> get props => [role];
}
