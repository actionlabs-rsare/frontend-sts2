import '../../../../i18n/strings.g.dart';

/// Maps a wire status to its i18n label. Single source of truth (previously repeated in three
/// separate widgets across stockholders, transactions and certificates).
String transactionStatusLabel(Translations t, String status) => switch (status) {
      'Submitted' => t.transactions.statusSubmitted,
      'PendingFirstApproval' => t.transactions.statusPendingFirstApproval,
      'PendingSecondApproval' => t.transactions.statusPendingSecondApproval,
      'Approved' => t.transactions.statusApproved,
      'Posted' => t.transactions.statusPosted,
      'Rejected' => t.transactions.statusRejected,
      _ => status,
    };
