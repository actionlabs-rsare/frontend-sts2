import 'package:equatable/equatable.dart';

import '../../domain/entities/family_group.dart';
import '../../domain/entities/stockholder.dart';

enum StockholderListStatus { initial, loading, success, failure }

class StockholderListState extends Equatable {
  const StockholderListState({
    this.status = StockholderListStatus.initial,
    this.stockholders = const [],
    this.familyGroups = const [],
    this.query = '',
    this.errorMessage,
  });

  final StockholderListStatus status;
  final List<Stockholder> stockholders;
  final List<FamilyGroup> familyGroups;
  final String query;
  final String? errorMessage;

  StockholderListState copyWith({
    StockholderListStatus? status,
    List<Stockholder>? stockholders,
    List<FamilyGroup>? familyGroups,
    String? query,
    String? errorMessage,
  }) {
    return StockholderListState(
      status: status ?? this.status,
      stockholders: stockholders ?? this.stockholders,
      familyGroups: familyGroups ?? this.familyGroups,
      query: query ?? this.query,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, stockholders, familyGroups, query, errorMessage];
}
