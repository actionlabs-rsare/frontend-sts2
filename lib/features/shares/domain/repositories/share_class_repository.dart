import '../entities/share_class.dart';

abstract interface class ShareClassRepository {
  Future<List<ShareClass>> list(String companyCode);
  Future<ShareClass> create(String companyCode, ShareClassDraft draft);
  Future<ShareClass> update(String companyCode, String id, ShareClassDraft draft);
}
