import 'package:equatable/equatable.dart';

enum CompanyFormStatus { idle, submitting, success, failure }

class CompanyFormState extends Equatable {
  const CompanyFormState({this.status = CompanyFormStatus.idle, this.errorMessage});

  final CompanyFormStatus status;
  final String? errorMessage;

  bool get isSubmitting => status == CompanyFormStatus.submitting;

  CompanyFormState copyWith({CompanyFormStatus? status, String? errorMessage}) =>
      CompanyFormState(status: status ?? this.status, errorMessage: errorMessage);

  @override
  List<Object?> get props => [status, errorMessage];
}
