import 'package:equatable/equatable.dart';
import 'package:jvadmin/src/features/navigation_bar/presententation/widget/destination.dart';

class DestinationRoute extends Equatable {
  const DestinationRoute({
    required this.page,
    required this.path,
    required this.destination,
  });
  final int page;
  final String path;
  final Destination destination;

  @override
  List<Object?> get props => <Object?>[page, path, destination];
}
