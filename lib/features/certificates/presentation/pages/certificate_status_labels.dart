import '../../../../i18n/strings.g.dart';

/// Maps a certificate/transaction wire status to its i18n label for the certificate screens.
String certificateStatusLabel(Translations t, String status) => switch (status) {
      'PendingFirstApproval' => t.transactions.statusPendingFirstApproval,
      'PendingSecondApproval' => t.transactions.statusPendingSecondApproval,
      _ => status,
    };
