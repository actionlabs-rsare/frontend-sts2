import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/datasources/auth_remote_data_source.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/dev_sign_in_use_case.dart';
import '../../features/auth/presentation/bloc/session_cubit.dart';
import '../../features/certificates/data/datasources/certificate_remote_data_source.dart';
import '../../features/certificates/data/repositories/certificate_reference_repository_impl.dart';
import '../../features/certificates/data/repositories/certificate_repository_impl.dart';
import '../../features/certificates/domain/repositories/certificate_reference_repository.dart';
import '../../features/certificates/domain/repositories/certificate_repository.dart';
import '../../features/certificates/domain/usecases/numbering_use_cases.dart';
import '../../features/certificates/domain/usecases/print_use_cases.dart';
import '../../features/certificates/domain/usecases/reference_use_cases.dart';
import '../../features/companies/data/datasources/company_remote_data_source.dart';
import '../../features/companies/data/repositories/company_repository_impl.dart';
import '../../features/companies/domain/repositories/company_repository.dart';
import '../../features/companies/domain/usecases/create_company_use_case.dart';
import '../../features/companies/domain/usecases/get_companies_use_case.dart';
import '../../features/shares/data/datasources/share_class_remote_data_source.dart';
import '../../features/shares/data/repositories/share_class_repository_impl.dart';
import '../../features/shares/domain/repositories/share_class_repository.dart';
import '../../features/shares/domain/usecases/get_share_classes_use_case.dart';
import '../../features/shares/domain/usecases/save_share_class_use_case.dart';
import '../../features/stockholders/data/datasources/family_group_remote_data_source.dart';
import '../../features/stockholders/data/datasources/stockholder_remote_data_source.dart';
import '../../features/stockholders/data/repositories/family_group_repository_impl.dart';
import '../../features/stockholders/data/repositories/stockholder_repository_impl.dart';
import '../../features/stockholders/domain/repositories/family_group_repository.dart';
import '../../features/stockholders/domain/repositories/stockholder_repository.dart';
import '../../features/stockholders/domain/usecases/create_family_group_use_case.dart';
import '../../features/stockholders/domain/usecases/deactivate_stockholder_use_case.dart';
import '../../features/stockholders/domain/usecases/get_family_group_members_use_case.dart';
import '../../features/stockholders/domain/usecases/get_family_groups_use_case.dart';
import '../../features/stockholders/domain/usecases/get_stockholders_use_case.dart';
import '../../features/stockholders/domain/usecases/save_stockholder_use_case.dart';
import '../../features/transactions/data/datasources/transaction_remote_data_source.dart';
import '../../features/transactions/data/repositories/transaction_repository_impl.dart';
import '../../features/transactions/domain/repositories/transaction_repository.dart';
import '../../features/transactions/domain/usecases/create_transfer_use_case.dart';
import '../../features/transactions/domain/usecases/get_transaction_report_use_case.dart';
import '../../features/transactions/domain/usecases/get_transaction_use_case.dart';
import '../../features/transactions/domain/usecases/get_transactions_use_case.dart';
import '../../features/transactions/domain/usecases/transaction_action_use_cases.dart';
import '../config/app_config.dart';
import '../network/dio_client.dart';

final getIt = GetIt.instance;

/// Registers every dependency the app needs. Called once from `main()` before `runApp`.
///
/// Order matters only where a lazy singleton's factory closure reads another registration
/// eagerly (none do here — everything resolves lazily through `getIt<T>()` inside the
/// factory), so features are grouped for readability, not for a required build order.
void configureDependencies({String baseUrl = AppConfig.apiBaseUrl}) {
  getIt.registerLazySingleton<Dio>(() => buildDioClient(baseUrl: baseUrl));

  _configureAuth();
  _configureCompanies();
  _configureShares();
  _configureStockholders();
  _configureTransactions();
  _configureCertificates();
}

void _configureAuth() {
  getIt
    ..registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(getIt()))
    ..registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(getIt()))
    ..registerFactory(() => DevSignInUseCase(getIt()))
    ..registerLazySingleton<SessionCubit>(() => SessionCubit(getIt()));
}

void _configureCompanies() {
  getIt
    ..registerLazySingleton<CompanyRemoteDataSource>(() => CompanyRemoteDataSourceImpl(getIt()))
    ..registerLazySingleton<CompanyRepository>(() => CompanyRepositoryImpl(getIt()))
    ..registerFactory(() => GetCompaniesUseCase(getIt()))
    ..registerFactory(() => CreateCompanyUseCase(getIt()));
}

void _configureShares() {
  getIt
    ..registerLazySingleton<ShareClassRemoteDataSource>(() => ShareClassRemoteDataSourceImpl(getIt()))
    ..registerLazySingleton<ShareClassRepository>(() => ShareClassRepositoryImpl(getIt()))
    ..registerFactory(() => GetShareClassesUseCase(getIt()))
    ..registerFactory(() => SaveShareClassUseCase(getIt()));
}

void _configureStockholders() {
  getIt
    ..registerLazySingleton<StockholderRemoteDataSource>(() => StockholderRemoteDataSourceImpl(getIt()))
    ..registerLazySingleton<StockholderRepository>(() => StockholderRepositoryImpl(getIt()))
    ..registerLazySingleton<FamilyGroupRemoteDataSource>(() => FamilyGroupRemoteDataSourceImpl(getIt()))
    ..registerLazySingleton<FamilyGroupRepository>(() => FamilyGroupRepositoryImpl(getIt()))
    ..registerFactory(() => GetStockholdersUseCase(getIt()))
    ..registerFactory(() => SaveStockholderUseCase(getIt()))
    ..registerFactory(() => DeactivateStockholderUseCase(getIt()))
    ..registerFactory(() => GetFamilyGroupsUseCase(getIt()))
    ..registerFactory(() => CreateFamilyGroupUseCase(getIt()))
    ..registerFactory(() => GetFamilyGroupMembersUseCase(getIt()));
}

void _configureTransactions() {
  getIt
    ..registerLazySingleton<TransactionRemoteDataSource>(() => TransactionRemoteDataSourceImpl(getIt()))
    ..registerLazySingleton<TransactionRepository>(() => TransactionRepositoryImpl(getIt()))
    ..registerFactory(() => GetTransactionsUseCase(getIt()))
    ..registerFactory(() => GetTransactionUseCase(getIt()))
    ..registerFactory(() => CreateTransferUseCase(getIt()))
    ..registerFactory(() => SubmitTransactionUseCase(getIt()))
    ..registerFactory(() => ApproveTransactionUseCase(getIt()))
    ..registerFactory(() => RejectTransactionUseCase(getIt()))
    ..registerFactory(() => MarkTransactionPrintedUseCase(getIt()))
    ..registerFactory(() => GetTransactionReportUseCase(getIt()));
}

void _configureCertificates() {
  getIt
    ..registerLazySingleton<CertificateRemoteDataSource>(() => CertificateRemoteDataSourceImpl(getIt()))
    ..registerLazySingleton<CertificateRepository>(() => CertificateRepositoryImpl(getIt()))
    ..registerLazySingleton<CertificateReferenceRepository>(() => const CertificateReferenceRepositoryImpl())
    ..registerFactory(() => GetNumberingUseCase(getIt()))
    ..registerFactory(() => SetNumberingUseCase(getIt()))
    ..registerFactory(() => PrintCertificatesUseCase(getIt()))
    ..registerFactory(() => ListCertificatesForTransactionUseCase(getIt()))
    ..registerFactory(() => DownloadCertificateDocumentUseCase(getIt()))
    ..registerFactory(() => GetCertificateCompaniesUseCase(getIt()))
    ..registerFactory(() => GetShareClassesForCompanyUseCase(getIt()))
    ..registerFactory(() => GetPrintableTransactionsUseCase(getIt()));
}
