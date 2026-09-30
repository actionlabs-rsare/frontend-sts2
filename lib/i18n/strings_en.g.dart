///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  _meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		_meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	final TranslationMetadata<AppLocale, Translations> _meta;
	@override TranslationMetadata<AppLocale, Translations> get $meta => _meta;

	/// Access flat map
	dynamic operator[](String key) => _meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final Translations$common$en common = Translations$common$en._(_root);
	late final Translations$nav$en nav = Translations$nav$en._(_root);
	late final Translations$auth$en auth = Translations$auth$en._(_root);
	late final Translations$companies$en companies = Translations$companies$en._(_root);
	late final Translations$shares$en shares = Translations$shares$en._(_root);
	late final Translations$stockholders$en stockholders = Translations$stockholders$en._(_root);
	late final Translations$familyGroups$en familyGroups = Translations$familyGroups$en._(_root);
	late final Translations$transactions$en transactions = Translations$transactions$en._(_root);
	late final Translations$certificates$en certificates = Translations$certificates$en._(_root);
}

// Path: common
class Translations$common$en {
	Translations$common$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'AP Stock Transfer System'
	String get appTitle => 'AP Stock Transfer System';

	/// en: 'AP'
	String get appShortName => 'AP';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Save'
	String get save => 'Save';

	/// en: 'Add a record'
	String get add => 'Add a record';

	/// en: 'Edit'
	String get edit => 'Edit';

	/// en: 'Close'
	String get close => 'Close';

	/// en: 'Clear'
	String get clear => 'Clear';

	/// en: 'Search'
	String get search => 'Search';

	/// en: 'View'
	String get view => 'View';

	/// en: 'Confirm'
	String get confirm => 'Confirm';

	/// en: 'Sign out'
	String get signOut => 'Sign out';

	/// en: 'Required'
	String get required => 'Required';

	/// en: 'Try again'
	String get tryAgain => 'Try again';

	/// en: 'Loading…'
	String get loading => 'Loading…';

	/// en: 'Actions'
	String get actions => 'Actions';

	/// en: 'Status'
	String get status => 'Status';

	/// en: 'Code'
	String get code => 'Code';

	/// en: 'Name'
	String get name => 'Name';

	/// en: '— none —'
	String get none => '— none —';

	/// en: '—'
	String get notAvailable => '—';
}

// Path: nav
class Translations$nav$en {
	Translations$nav$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Transactions'
	String get transactions => 'Transactions';

	/// en: 'Maintenance'
	String get maintenance => 'Maintenance';

	/// en: 'Inquiry'
	String get inquiry => 'Inquiry';

	/// en: 'Reports'
	String get reports => 'Reports';

	/// en: 'Settings'
	String get settings => 'Settings';
}

// Path: auth
class Translations$auth$en {
	Translations$auth$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Dev sign-in'
	String get devSignInTitle => 'Dev sign-in';

	/// en: 'Choose a role (dev only — replaced by SSO later).'
	String get devSignInSubtitle => 'Choose a role (dev only — replaced by SSO later).';

	/// en: 'Role'
	String get roleLabel => 'Role';

	/// en: 'Sign in'
	String get signIn => 'Sign in';

	/// en: 'Sign-in failed. Is the backend running with dev-auth enabled?'
	String get signInFailed => 'Sign-in failed. Is the backend running with dev-auth enabled?';

	/// en: '(dev role switcher)'
	String get roleChipSuffix => '(dev role switcher)';
}

// Path: companies
class Translations$companies$en {
	Translations$companies$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Companies'
	String get title => 'Companies';

	/// en: 'Company maintenance'
	String get heading => 'Company maintenance';

	/// en: 'Add company'
	String get addCompany => 'Add company';

	/// en: 'Could not load companies.'
	String get loadError => 'Could not load companies.';

	/// en: 'No companies yet.'
	String get empty => 'No companies yet.';

	/// en: 'Code'
	String get columnCode => 'Code';

	/// en: 'Name'
	String get columnName => 'Name';

	/// en: 'Address'
	String get columnAddress => 'Address';

	/// en: 'President'
	String get columnPresident => 'President';

	/// en: 'Add company'
	String get formTitleAdd => 'Add company';

	/// en: 'Name *'
	String get fieldName => 'Name *';

	/// en: 'Address *'
	String get fieldAddress => 'Address *';

	/// en: 'TIN'
	String get fieldTin => 'TIN';

	/// en: 'President'
	String get fieldPresident => 'President';

	/// en: 'Corporate Secretary'
	String get fieldCorpSec => 'Corporate Secretary';

	/// en: 'Could not create company. Check your permissions and inputs.'
	String get createError => 'Could not create company. Check your permissions and inputs.';
}

// Path: shares
class Translations$shares$en {
	Translations$shares$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Company shares'
	String get pageTitle => 'Company shares';

	/// en: 'Totals compute from authorized shares × par value (MDM-003).'
	String get pageDescription => 'Totals compute from authorized shares × par value (MDM-003).';

	/// en: 'Company'
	String get companyLabel => 'Company';

	/// en: 'Loading share classes…'
	String get loading => 'Loading share classes…';

	/// en: 'Could not load share classes.'
	String get loadError => 'Could not load share classes.';

	/// en: '$companyCode has no share classes yet.'
	String emptyTitle({required Object companyCode}) => '${companyCode} has no share classes yet.';

	/// en: 'Add one to start its certificate numbering.'
	String get emptySubtitle => 'Add one to start its certificate numbering.';

	/// en: 'Stock type'
	String get colStockType => 'Stock type';

	/// en: 'Par value'
	String get colParValue => 'Par value';

	/// en: 'Authorized'
	String get colAuthorized => 'Authorized';

	/// en: 'Subscribed'
	String get colSubscribed => 'Subscribed';

	/// en: 'Issued'
	String get colIssued => 'Issued';

	/// en: 'Treasury'
	String get colTreasury => 'Treasury';

	/// en: 'Total amount'
	String get colTotalAmount => 'Total amount';

	/// en: 'Next cert. no.'
	String get colNextCert => 'Next cert. no.';

	/// en: 'Each share class keeps an independent certificate-number sequence starting at 1 (MDM-003, SL-002), with a separate replacement sequence (TR-004).'
	String get footNote => 'Each share class keeps an independent certificate-number sequence starting at 1 (MDM-003, SL-002), with a separate replacement sequence (TR-004).';

	/// en: 'Add share class'
	String get formTitleAdd => 'Add share class';

	/// en: 'Edit share class'
	String get formTitleEdit => 'Edit share class';

	/// en: 'Share class details'
	String get sectionDetails => 'Share class details';

	/// en: 'Stock type *'
	String get fieldStockType => 'Stock type *';

	/// en: 'Par value *'
	String get fieldParValue => 'Par value *';

	/// en: 'Authorized shares *'
	String get fieldAuthorized => 'Authorized shares *';

	/// en: 'Subscribed shares'
	String get fieldSubscribed => 'Subscribed shares';

	/// en: 'Issued shares'
	String get fieldIssued => 'Issued shares';

	/// en: 'Treasury shares'
	String get fieldTreasury => 'Treasury shares';

	/// en: 'Total amount (auto)'
	String get fieldTotalAmount => 'Total amount (auto)';

	/// en: 'Total amount is authorized shares × par value, computed by the server. Saving a new class also opens its own certificate-number sequence at 1, plus a separate replacement series.'
	String get totalHint => 'Total amount is authorized shares × par value, computed by the server. Saving a new class also opens its own certificate-number sequence at 1, plus a separate replacement series.';

	/// en: 'Could not save the share class. Check that treasury ≤ issued ≤ subscribed ≤ authorized, and that this company does not already have a $stockType class.'
	String saveError({required Object stockType}) => 'Could not save the share class. Check that treasury ≤ issued ≤ subscribed ≤ authorized, and that this company does not already have a ${stockType} class.';
}

// Path: stockholders
class Translations$stockholders$en {
	Translations$stockholders$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Stockholders'
	String get pageTitle => 'Stockholders';

	/// en: 'Stockholders are maintained separately from companies (MDM-002).'
	String get pageDescription => 'Stockholders are maintained separately from companies (MDM-002).';

	/// en: 'Stockholder code or name'
	String get searchHint => 'Stockholder code or name';

	/// en: 'Loading stockholders…'
	String get loading => 'Loading stockholders…';

	/// en: 'Could not load stockholders.'
	String get loadError => 'Could not load stockholders.';

	/// en: 'Check that you are signed in, then try again.'
	String get loadErrorHint => 'Check that you are signed in, then try again.';

	/// en: 'No stockholders match this search.'
	String get emptyTitle => 'No stockholders match this search.';

	/// en: 'Clear the search, or add a stockholder.'
	String get emptySubtitle => 'Clear the search, or add a stockholder.';

	/// en: 'Name'
	String get colName => 'Name';

	/// en: 'Type'
	String get colType => 'Type';

	/// en: 'Nationality'
	String get colNationality => 'Nationality';

	/// en: 'TIN'
	String get colTin => 'TIN';

	/// en: 'Masked — open the record to see the full TIN'
	String get maskedTinTooltip => 'Masked — open the record to see the full TIN';

	/// en: 'Deactivate'
	String get deactivateTooltip => 'Deactivate';

	/// en: 'Already inactive'
	String get alreadyInactiveTooltip => 'Already inactive';

	/// en: 'Deactivate this stockholder?'
	String get confirmDeactivateTitle => 'Deactivate this stockholder?';

	/// en: '$code — $name The record stays in the system with its full history; it is marked inactive and excluded from new transactions. Stock Transfer never deletes records.'
	String confirmDeactivateBody({required Object code, required Object name}) => '${code} — ${name}\n\nThe record stays in the system with its full history; it is marked inactive and excluded from new transactions. Stock Transfer never deletes records.';

	/// en: 'Deactivate'
	String get deactivateAction => 'Deactivate';

	/// en: 'Stockholder $code deactivated'
	String deactivatedSnack({required Object code}) => 'Stockholder ${code} deactivated';

	/// en: 'Could not deactivate $code — check your permissions'
	String deactivateFailedSnack({required Object code}) => 'Could not deactivate ${code} — check your permissions';

	/// en: 'Stockholder $code created'
	String createdSnack({required Object code}) => 'Stockholder ${code} created';

	/// en: 'Stockholder $code updated'
	String updatedSnack({required Object code}) => 'Stockholder ${code} updated';

	/// en: 'Add stockholder'
	String get formTitleAdd => 'Add stockholder';

	/// en: 'Edit stockholder'
	String get formTitleEdit => 'Edit stockholder';

	/// en: 'Stockholder details'
	String get sectionDetails => 'Stockholder details';

	/// en: 'Corporate details'
	String get sectionCorporate => 'Corporate details';

	/// en: 'Stockholder code'
	String get fieldCode => 'Stockholder code';

	/// en: 'Auto-assigned'
	String get fieldAutoAssigned => 'Auto-assigned';

	/// en: 'Stockholder type *'
	String get fieldType => 'Stockholder type *';

	/// en: 'Full name (Last, First, Middle) *'
	String get fieldFullName => 'Full name (Last, First, Middle) *';

	/// en: 'TIN *'
	String get fieldTin => 'TIN *';

	/// en: 'Nationality *'
	String get fieldNationality => 'Nationality *';

	/// en: 'Gender *'
	String get fieldGender => 'Gender *';

	/// en: 'Email *'
	String get fieldEmail => 'Email *';

	/// en: 'Mobile'
	String get fieldMobile => 'Mobile';

	/// en: 'Address'
	String get fieldAddress => 'Address';

	/// en: 'Family group'
	String get fieldFamilyGroup => 'Family group';

	/// en: 'Optional (MDM-002-FG)'
	String get fieldFamilyGroupHelper => 'Optional (MDM-002-FG)';

	/// en: 'Type of corporation'
	String get fieldCorporationType => 'Type of corporation';

	/// en: 'TIN, nationality, gender and contact details are personal data: encrypted at rest, masked in logs and restricted by role.'
	String get piiNotice => 'TIN, nationality, gender and contact details are personal data: encrypted at rest, masked in logs and restricted by role.';

	/// en: 'Could not save this stockholder. Check the required fields, then try again.'
	String get saveErrorEdit => 'Could not save this stockholder. Check the required fields, then try again.';

	/// en: 'Could not create the stockholder. Check the required fields and your permissions.'
	String get saveErrorAdd => 'Could not create the stockholder. Check the required fields and your permissions.';

	/// en: 'Type'
	String get detailType => 'Type';

	/// en: 'Nationality'
	String get detailNationality => 'Nationality';

	/// en: 'Gender'
	String get detailGender => 'Gender';

	/// en: 'TIN'
	String get detailTin => 'TIN';

	/// en: 'Email'
	String get detailEmail => 'Email';

	/// en: 'Mobile'
	String get detailMobile => 'Mobile';

	/// en: 'Address'
	String get detailAddress => 'Address';

	/// en: 'Family group'
	String get detailFamilyGroup => 'Family group';

	/// en: 'Status'
	String get detailStatus => 'Status';

	/// en: 'Female'
	String get genderFemale => 'Female';

	/// en: 'Male'
	String get genderMale => 'Male';

	/// en: 'Prefer not to say'
	String get genderPreferNotToSay => 'Prefer not to say';

	/// en: 'Individual'
	String get typeIndividual => 'Individual';

	/// en: 'Corporate'
	String get typeCorporate => 'Corporate';

	/// en: 'Domestic'
	String get corpDomestic => 'Domestic';

	/// en: 'Foreign'
	String get corpForeign => 'Foreign';
}

// Path: familyGroups
class Translations$familyGroups$en {
	Translations$familyGroups$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Family groups'
	String get pageTitle => 'Family groups';

	/// en: 'Grouped shareholdings by family (MDM-002-FG). Grouping rules pending AP Corsec sign-off.'
	String get pageDescription => 'Grouped shareholdings by family (MDM-002-FG). Grouping rules pending AP Corsec sign-off.';

	/// en: 'Add a group'
	String get addGroup => 'Add a group';

	/// en: 'Add family group'
	String get addDialogTitle => 'Add family group';

	/// en: 'Group name *'
	String get fieldName => 'Group name *';

	/// en: 'For example: Santiago family'
	String get fieldNameHint => 'For example: Santiago family';

	/// en: 'Family group $id created'
	String createdSnack({required Object id}) => 'Family group ${id} created';

	/// en: 'Could not create the family group — check your permissions'
	String get createFailedSnack => 'Could not create the family group — check your permissions';

	/// en: 'Could not load family groups.'
	String get loadError => 'Could not load family groups.';

	/// en: 'No family groups yet. Add one, then assign stockholders to it.'
	String get emptyGroups => 'No family groups yet. Add one, then assign stockholders to it.';

	/// en: 'Choose a family group to see its members and combined shareholdings.'
	String get chooseGroupPrompt => 'Choose a family group to see its members and combined shareholdings.';

	/// en: 'Could not load the group members.'
	String get loadMembersError => 'Could not load the group members.';

	/// en: 'No stockholders are assigned to this group yet.'
	String get emptyMembers => 'No stockholders are assigned to this group yet.';

	/// en: 'Shares held'
	String get colSharesHeld => 'Shares held';

	/// en: 'Pending'
	String get pendingShares => 'Pending';

	/// en: 'Combined shareholdings become available once the transfer and posting slice publishes the holding ledger (Wave 2).'
	String get combinedPending => 'Combined shareholdings become available once the transfer and posting slice publishes the holding ledger (Wave 2).';

	/// en: 'Combined shareholdings: $combined shares across $known of $total members.'
	String combinedSummary({required Object combined, required Object known, required Object total}) => 'Combined shareholdings: ${combined} shares across ${known} of ${total} members.';
}

// Path: transactions
class Translations$transactions$en {
	Translations$transactions$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Transactions'
	String get pageTitle => 'Transactions';

	/// en: 'Report (PDF)'
	String get reportButton => 'Report (PDF)';

	/// en: 'Add transaction'
	String get addButton => 'Add transaction';

	/// en: 'Could not load transactions.'
	String get loadError => 'Could not load transactions.';

	/// en: 'No transactions yet. Use “Add transaction” to record a transfer.'
	String get empty => 'No transactions yet. Use “Add transaction” to record a transfer.';

	/// en: 'Reference'
	String get colReference => 'Reference';

	/// en: 'Company'
	String get colCompany => 'Company';

	/// en: 'Transfer type'
	String get colTransferType => 'Transfer type';

	/// en: 'Date'
	String get colDate => 'Date';

	/// en: 'Transaction report generated (PDF, $bytes bytes) at $time.'
	String reportGenerated({required Object bytes, required Object time}) => 'Transaction report generated (PDF, ${bytes} bytes) at ${time}.';

	/// en: 'Could not generate the report.'
	String get reportFailed => 'Could not generate the report.';

	/// en: 'Add a transfer'
	String get addTitle => 'Add a transfer';

	/// en: 'Transfer only (TR-003). Additional subscriptions are not processed here.'
	String get addSubtitle => 'Transfer only (TR-003). Additional subscriptions are not processed here.';

	/// en: 'Common details'
	String get sectionCommon => 'Common details';

	/// en: 'Transfer details — transferor → transferee'
	String get sectionLines => 'Transfer details — transferor → transferee';

	/// en: 'Company *'
	String get fieldCompany => 'Company *';

	/// en: 'Transaction date * (YYYY-MM-DD)'
	String get fieldDate => 'Transaction date * (YYYY-MM-DD)';

	/// en: 'Request reference (SRF no.)'
	String get fieldSrf => 'Request reference (SRF no.)';

	/// en: 'Transfer type *'
	String get fieldTransferType => 'Transfer type *';

	/// en: 'Remarks (optional)'
	String get fieldRemarks => 'Remarks (optional)';

	/// en: 'Override / void (needs a 2nd approval by the Team Leader)'
	String get exceptionCheckbox => 'Override / void (needs a 2nd approval by the Team Leader)';

	/// en: 'From (transferor) *'
	String get fieldFrom => 'From (transferor) *';

	/// en: 'To (transferee) *'
	String get fieldTo => 'To (transferee) *';

	/// en: 'Share class *'
	String get fieldShareClass => 'Share class *';

	/// en: 'Shares *'
	String get fieldShares => 'Shares *';

	/// en: 'Certificate *'
	String get fieldCertificate => 'Certificate *';

	/// en: 'Add line'
	String get addLine => 'Add line';

	/// en: 'Remove line'
	String get removeLine => 'Remove line';

	/// en: 'Submit transaction'
	String get submitTransaction => 'Submit transaction';

	/// en: 'Shares are conserved (transferor decrease = transferee increase; cannot exceed held). Submitting routes to a 1st Level Approver (SL-004). Every action is audited.'
	String get footNote => 'Shares are conserved (transferor decrease = transferee increase; cannot exceed held). Submitting routes to a 1st Level Approver (SL-004). Every action is audited.';

	/// en: 'Use YYYY-MM-DD'
	String get dateFormatError => 'Use YYYY-MM-DD';

	/// en: 'Must be ≥ 1'
	String get sharesMinError => 'Must be ≥ 1';

	/// en: 'Could not create the transfer. Check your permissions and inputs.'
	String get createError => 'Could not create the transfer. Check your permissions and inputs.';

	/// en: 'Back to transactions'
	String get backToList => 'Back to transactions';

	/// en: 'Could not load the transaction.'
	String get loadDetailError => 'Could not load the transaction.';

	/// en: 'No actions available for your role in this state.'
	String get noActions => 'No actions available for your role in this state.';

	/// en: 'Submit for approval'
	String get submitForApproval => 'Submit for approval';

	/// en: 'Approve'
	String get approve => 'Approve';

	/// en: 'Approve (2nd level)'
	String get approveSecondLevel => 'Approve (2nd level)';

	/// en: 'Reject'
	String get reject => 'Reject';

	/// en: 'Mark printed → post'
	String get markPrinted => 'Mark printed → post';

	/// en: 'Reason (required)'
	String get reasonRequired => 'Reason (required)';

	/// en: 'Reason (optional)'
	String get reasonOptional => 'Reason (optional)';

	/// en: 'Enter a note for the audit trail'
	String get reasonHint => 'Enter a note for the audit trail';

	/// en: '$message at $time.'
	String actionSuccessAt({required Object message, required Object time}) => '${message} at ${time}.';

	/// en: 'Your role may not perform this action.'
	String get actionForbidden => 'Your role may not perform this action.';

	/// en: 'That action is not allowed in the current state, or a reason is required.'
	String get actionInvalidState => 'That action is not allowed in the current state, or a reason is required.';

	/// en: 'Action failed. Please try again.'
	String get actionFailed => 'Action failed. Please try again.';

	/// en: 'Share breakdown (computed)'
	String get breakdownTitle => 'Share breakdown (computed)';

	/// en: 'Transfer lines'
	String get linesTitle => 'Transfer lines';

	/// en: 'Approval history'
	String get approvalsTitle => 'Approval history';

	/// en: 'Not yet submitted for approval.'
	String get noApprovals => 'Not yet submitted for approval.';

	/// en: 'Company'
	String get metaCompany => 'Company';

	/// en: 'Date'
	String get metaDate => 'Date';

	/// en: 'SRF'
	String get metaSrf => 'SRF';

	/// en: 'Type'
	String get metaType => 'Type';

	/// en: 'Exception'
	String get metaException => 'Exception';

	/// en: 'Posted at'
	String get metaPostedAt => 'Posted at';

	/// en: 'Remarks: $remarks'
	String remarksPrefix({required Object remarks}) => 'Remarks: ${remarks}';

	/// en: 'Submitted'
	String get statusSubmitted => 'Submitted';

	/// en: 'Pending 1st approval'
	String get statusPendingFirstApproval => 'Pending 1st approval';

	/// en: 'Pending 2nd approval'
	String get statusPendingSecondApproval => 'Pending 2nd approval';

	/// en: 'Approved'
	String get statusApproved => 'Approved';

	/// en: 'Posted'
	String get statusPosted => 'Posted';

	/// en: 'Rejected'
	String get statusRejected => 'Rejected';
}

// Path: certificates
class Translations$certificates$en {
	Translations$certificates$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Settings › Stock certificate configuration'
	String get numberingBreadcrumb => 'Settings › Stock certificate configuration';

	/// en: 'Certificate numbering'
	String get numberingTitle => 'Certificate numbering';

	/// en: 'Set the starting point per share class. Each class and its replacement sequence are independent (SL-002, TR-004).'
	String get numberingDescription => 'Set the starting point per share class. Each class and its replacement sequence are independent (SL-002, TR-004).';

	/// en: 'Company'
	String get companyLabel => 'Company';

	/// en: 'Loading certificate sequences…'
	String get loadingSequences => 'Loading certificate sequences…';

	/// en: 'Could not load the sequences.'
	String get loadSequencesError => 'Could not load the sequences.';

	/// en: 'This company has no share classes yet. Define them in Maintenance › Company shares (MDM-003) first.'
	String get noShareClasses => 'This company has no share classes yet. Define them in Maintenance › Company shares (MDM-003) first.';

	/// en: 'Share class'
	String get colShareClass => 'Share class';

	/// en: 'Sequence'
	String get colSequence => 'Sequence';

	/// en: 'Starting number'
	String get colStartingNumber => 'Starting number';

	/// en: 'Next number'
	String get colNextNumber => 'Next number';

	/// en: 'Numbering mode'
	String get colNumberingMode => 'Numbering mode';

	/// en: 'Original issuance'
	String get originalIssuance => 'Original issuance';

	/// en: 'Replacement (separate)'
	String get replacementSeparate => 'Replacement (separate)';

	/// en: 'Numbers run on without gaps and are never reused (S3-Q7, TR-004). A starting point can be set until its first certificate is issued. Manual numbers need Team Leader approval (TR-018).'
	String get footNote => 'Numbers run on without gaps and are never reused (S3-Q7, TR-004). A starting point can be set until its first certificate is issued. Manual numbers need Team Leader approval (TR-018).';

	/// en: 'Edit numbering · $stockType'
	String editDialogTitle({required Object stockType}) => 'Edit numbering · ${stockType}';

	/// en: 'Starting points (SL-002)'
	String get sectionStartingPoints => 'Starting points (SL-002)';

	/// en: 'Original issuance · starting number'
	String get fieldOriginalStart => 'Original issuance · starting number';

	/// en: 'Replacement (separate) · starting number'
	String get fieldReplacementStart => 'Replacement (separate) · starting number';

	/// en: 'Numbering mode'
	String get sectionNumberingMode => 'Numbering mode';

	/// en: 'Mode'
	String get modeLabel => 'Mode';

	/// en: 'Manual (pre-printed stock, e.g. VECO): every print needs a Team Leader to confirm the number on the pre-printed form.'
	String get modeHelper => 'Manual (pre-printed stock, e.g. VECO): every print needs a Team Leader to confirm the number on the pre-printed form.';

	/// en: 'Set the starting point?'
	String get confirmStartTitle => 'Set the starting point?';

	/// en: 'Set starting point'
	String get setStartingPoint => 'Set starting point';

	/// en: 'Save configuration'
	String get saveConfiguration => 'Save configuration';

	/// en: 'Transactions › Print certificates'
	String get printBreadcrumb => 'Transactions › Print certificates';

	/// en: 'Print certificates'
	String get printTitle => 'Print certificates';

	/// en: 'Print approved transactions on a pre-printed form or the system template. Numbers come from each share class sequence (TR-017, TR-018).'
	String get printDescription => 'Print approved transactions on a pre-printed form or the system template. Numbers come from each share class sequence (TR-017, TR-018).';

	/// en: 'Transactions to print'
	String get transactionsToPrint => 'Transactions to print';

	/// en: 'Sample data (Wave 1)'
	String get sampleDataNote => 'Sample data (Wave 1)';

	/// en: 'Reference'
	String get colReference => 'Reference';

	/// en: 'Company'
	String get colCompany => 'Company';

	/// en: 'Details'
	String get colDetails => 'Details';

	/// en: 'Only approved transactions can be printed'
	String get onlyApprovedTooltip => 'Only approved transactions can be printed';

	/// en: 'Print $id'
	String printTooltip({required Object id}) => 'Print ${id}';

	/// en: 'Print certificates · $id'
	String printDialogTitle({required Object id}) => 'Print certificates · ${id}';

	/// en: 'Print option (TR-017)'
	String get sectionPrintOption => 'Print option (TR-017)';

	/// en: 'Certificate number (TR-018)'
	String get sectionCertificateNumber => 'Certificate number (TR-018)';

	/// en: 'Numbers are assigned automatically from the share class sequence.'
	String get autoNumberHint => 'Numbers are assigned automatically from the share class sequence.';

	/// en: 'Use a manual number instead (Team Leader approval)'
	String get useManualNumber => 'Use a manual number instead (Team Leader approval)';

	/// en: 'Manual certificate number'
	String get manualNumberField => 'Manual certificate number';

	/// en: 'Must be the next number in the sequence (no gaps). Use it to confirm the number on a pre-printed form, e.g. 500.'
	String get manualNumberHelper => 'Must be the next number in the sequence (no gaps). Use it to confirm the number on a pre-printed form, e.g. 500.';

	/// en: 'I am the Team Leader and I approve this number'
	String get teamLeaderApprovalCheckbox => 'I am the Team Leader and I approve this number';

	/// en: 'The server checks your role; other roles are refused and the attempt is recorded.'
	String get teamLeaderApprovalHelper => 'The server checks your role; other roles are refused and the attempt is recorded.';

	/// en: 'Print'
	String get print => 'Print';

	/// en: 'Printing…'
	String get printing => 'Printing…';

	/// en: 'Certificates · $id'
	String certificatesFor({required Object id}) => 'Certificates · ${id}';

	/// en: 'Download PDF'
	String get downloadPdf => 'Download PDF';

	/// en: 'Preparing PDF…'
	String get preparingPdf => 'Preparing PDF…';

	/// en: 'Loading certificates…'
	String get loadingCertificates => 'Loading certificates…';

	/// en: 'No certificates printed for $id yet. Use Print to assign numbers.'
	String noCertificatesYet({required Object id}) => 'No certificates printed for ${id} yet. Use Print to assign numbers.';

	/// en: 'Cert no.'
	String get colCertNo => 'Cert no.';

	/// en: 'Stockholder'
	String get colHolderStockholder => 'Stockholder';

	/// en: 'No. of shares'
	String get colSharesCount => 'No. of shares';

	/// en: 'PDF for $id downloaded at $time ($size KB).'
	String downloadSuccess({required Object id, required Object time, required Object size}) => 'PDF for ${id} downloaded at ${time} (${size} KB).';

	/// en: 'The PDF for $id was generated, but this platform cannot save files. Use the web app.'
	String downloadUnsupported({required Object id}) => 'The PDF for ${id} was generated, but this platform cannot save files. Use the web app.';

	/// en: 'Could not download the PDF. Try again.'
	String get downloadError => 'Could not download the PDF. Try again.';

	/// en: '$count certificate(s) ready for $id at $time: $numbers. Download the PDF to print them.'
	String printReadySuccess({required Object count, required Object id, required Object time, required Object numbers}) => '${count} certificate(s) ready for ${id} at ${time}: ${numbers}. Download the PDF to print them.';

	/// en: 'Could not load the certificates for $id. Try again.'
	String loadCertificatesError({required Object id}) => 'Could not load the certificates for ${id}. Try again.';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'common.appTitle' => 'AP Stock Transfer System',
			'common.appShortName' => 'AP',
			'common.cancel' => 'Cancel',
			'common.save' => 'Save',
			'common.add' => 'Add a record',
			'common.edit' => 'Edit',
			'common.close' => 'Close',
			'common.clear' => 'Clear',
			'common.search' => 'Search',
			'common.view' => 'View',
			'common.confirm' => 'Confirm',
			'common.signOut' => 'Sign out',
			'common.required' => 'Required',
			'common.tryAgain' => 'Try again',
			'common.loading' => 'Loading…',
			'common.actions' => 'Actions',
			'common.status' => 'Status',
			'common.code' => 'Code',
			'common.name' => 'Name',
			'common.none' => '— none —',
			'common.notAvailable' => '—',
			'nav.transactions' => 'Transactions',
			'nav.maintenance' => 'Maintenance',
			'nav.inquiry' => 'Inquiry',
			'nav.reports' => 'Reports',
			'nav.settings' => 'Settings',
			'auth.devSignInTitle' => 'Dev sign-in',
			'auth.devSignInSubtitle' => 'Choose a role (dev only — replaced by SSO later).',
			'auth.roleLabel' => 'Role',
			'auth.signIn' => 'Sign in',
			'auth.signInFailed' => 'Sign-in failed. Is the backend running with dev-auth enabled?',
			'auth.roleChipSuffix' => '(dev role switcher)',
			'companies.title' => 'Companies',
			'companies.heading' => 'Company maintenance',
			'companies.addCompany' => 'Add company',
			'companies.loadError' => 'Could not load companies.',
			'companies.empty' => 'No companies yet.',
			'companies.columnCode' => 'Code',
			'companies.columnName' => 'Name',
			'companies.columnAddress' => 'Address',
			'companies.columnPresident' => 'President',
			'companies.formTitleAdd' => 'Add company',
			'companies.fieldName' => 'Name *',
			'companies.fieldAddress' => 'Address *',
			'companies.fieldTin' => 'TIN',
			'companies.fieldPresident' => 'President',
			'companies.fieldCorpSec' => 'Corporate Secretary',
			'companies.createError' => 'Could not create company. Check your permissions and inputs.',
			'shares.pageTitle' => 'Company shares',
			'shares.pageDescription' => 'Totals compute from authorized shares × par value (MDM-003).',
			'shares.companyLabel' => 'Company',
			'shares.loading' => 'Loading share classes…',
			'shares.loadError' => 'Could not load share classes.',
			'shares.emptyTitle' => ({required Object companyCode}) => '${companyCode} has no share classes yet.',
			'shares.emptySubtitle' => 'Add one to start its certificate numbering.',
			'shares.colStockType' => 'Stock type',
			'shares.colParValue' => 'Par value',
			'shares.colAuthorized' => 'Authorized',
			'shares.colSubscribed' => 'Subscribed',
			'shares.colIssued' => 'Issued',
			'shares.colTreasury' => 'Treasury',
			'shares.colTotalAmount' => 'Total amount',
			'shares.colNextCert' => 'Next cert. no.',
			'shares.footNote' => 'Each share class keeps an independent certificate-number sequence starting at 1 (MDM-003, SL-002), with a separate replacement sequence (TR-004).',
			'shares.formTitleAdd' => 'Add share class',
			'shares.formTitleEdit' => 'Edit share class',
			'shares.sectionDetails' => 'Share class details',
			'shares.fieldStockType' => 'Stock type *',
			'shares.fieldParValue' => 'Par value *',
			'shares.fieldAuthorized' => 'Authorized shares *',
			'shares.fieldSubscribed' => 'Subscribed shares',
			'shares.fieldIssued' => 'Issued shares',
			'shares.fieldTreasury' => 'Treasury shares',
			'shares.fieldTotalAmount' => 'Total amount (auto)',
			'shares.totalHint' => 'Total amount is authorized shares × par value, computed by the server. Saving a new class also opens its own certificate-number sequence at 1, plus a separate replacement series.',
			'shares.saveError' => ({required Object stockType}) => 'Could not save the share class. Check that treasury ≤ issued ≤ subscribed ≤ authorized, and that this company does not already have a ${stockType} class.',
			'stockholders.pageTitle' => 'Stockholders',
			'stockholders.pageDescription' => 'Stockholders are maintained separately from companies (MDM-002).',
			'stockholders.searchHint' => 'Stockholder code or name',
			'stockholders.loading' => 'Loading stockholders…',
			'stockholders.loadError' => 'Could not load stockholders.',
			'stockholders.loadErrorHint' => 'Check that you are signed in, then try again.',
			'stockholders.emptyTitle' => 'No stockholders match this search.',
			'stockholders.emptySubtitle' => 'Clear the search, or add a stockholder.',
			'stockholders.colName' => 'Name',
			'stockholders.colType' => 'Type',
			'stockholders.colNationality' => 'Nationality',
			'stockholders.colTin' => 'TIN',
			'stockholders.maskedTinTooltip' => 'Masked — open the record to see the full TIN',
			'stockholders.deactivateTooltip' => 'Deactivate',
			'stockholders.alreadyInactiveTooltip' => 'Already inactive',
			'stockholders.confirmDeactivateTitle' => 'Deactivate this stockholder?',
			'stockholders.confirmDeactivateBody' => ({required Object code, required Object name}) => '${code} — ${name}\n\nThe record stays in the system with its full history; it is marked inactive and excluded from new transactions. Stock Transfer never deletes records.',
			'stockholders.deactivateAction' => 'Deactivate',
			'stockholders.deactivatedSnack' => ({required Object code}) => 'Stockholder ${code} deactivated',
			'stockholders.deactivateFailedSnack' => ({required Object code}) => 'Could not deactivate ${code} — check your permissions',
			'stockholders.createdSnack' => ({required Object code}) => 'Stockholder ${code} created',
			'stockholders.updatedSnack' => ({required Object code}) => 'Stockholder ${code} updated',
			'stockholders.formTitleAdd' => 'Add stockholder',
			'stockholders.formTitleEdit' => 'Edit stockholder',
			'stockholders.sectionDetails' => 'Stockholder details',
			'stockholders.sectionCorporate' => 'Corporate details',
			'stockholders.fieldCode' => 'Stockholder code',
			'stockholders.fieldAutoAssigned' => 'Auto-assigned',
			'stockholders.fieldType' => 'Stockholder type *',
			'stockholders.fieldFullName' => 'Full name (Last, First, Middle) *',
			'stockholders.fieldTin' => 'TIN *',
			'stockholders.fieldNationality' => 'Nationality *',
			'stockholders.fieldGender' => 'Gender *',
			'stockholders.fieldEmail' => 'Email *',
			'stockholders.fieldMobile' => 'Mobile',
			'stockholders.fieldAddress' => 'Address',
			'stockholders.fieldFamilyGroup' => 'Family group',
			'stockholders.fieldFamilyGroupHelper' => 'Optional (MDM-002-FG)',
			'stockholders.fieldCorporationType' => 'Type of corporation',
			'stockholders.piiNotice' => 'TIN, nationality, gender and contact details are personal data: encrypted at rest, masked in logs and restricted by role.',
			'stockholders.saveErrorEdit' => 'Could not save this stockholder. Check the required fields, then try again.',
			'stockholders.saveErrorAdd' => 'Could not create the stockholder. Check the required fields and your permissions.',
			'stockholders.detailType' => 'Type',
			'stockholders.detailNationality' => 'Nationality',
			'stockholders.detailGender' => 'Gender',
			'stockholders.detailTin' => 'TIN',
			'stockholders.detailEmail' => 'Email',
			'stockholders.detailMobile' => 'Mobile',
			'stockholders.detailAddress' => 'Address',
			'stockholders.detailFamilyGroup' => 'Family group',
			'stockholders.detailStatus' => 'Status',
			'stockholders.genderFemale' => 'Female',
			'stockholders.genderMale' => 'Male',
			'stockholders.genderPreferNotToSay' => 'Prefer not to say',
			'stockholders.typeIndividual' => 'Individual',
			'stockholders.typeCorporate' => 'Corporate',
			'stockholders.corpDomestic' => 'Domestic',
			'stockholders.corpForeign' => 'Foreign',
			'familyGroups.pageTitle' => 'Family groups',
			'familyGroups.pageDescription' => 'Grouped shareholdings by family (MDM-002-FG). Grouping rules pending AP Corsec sign-off.',
			'familyGroups.addGroup' => 'Add a group',
			'familyGroups.addDialogTitle' => 'Add family group',
			'familyGroups.fieldName' => 'Group name *',
			'familyGroups.fieldNameHint' => 'For example: Santiago family',
			'familyGroups.createdSnack' => ({required Object id}) => 'Family group ${id} created',
			'familyGroups.createFailedSnack' => 'Could not create the family group — check your permissions',
			'familyGroups.loadError' => 'Could not load family groups.',
			'familyGroups.emptyGroups' => 'No family groups yet. Add one, then assign stockholders to it.',
			'familyGroups.chooseGroupPrompt' => 'Choose a family group to see its members and combined shareholdings.',
			'familyGroups.loadMembersError' => 'Could not load the group members.',
			'familyGroups.emptyMembers' => 'No stockholders are assigned to this group yet.',
			'familyGroups.colSharesHeld' => 'Shares held',
			'familyGroups.pendingShares' => 'Pending',
			'familyGroups.combinedPending' => 'Combined shareholdings become available once the transfer and posting slice publishes the holding ledger (Wave 2).',
			'familyGroups.combinedSummary' => ({required Object combined, required Object known, required Object total}) => 'Combined shareholdings: ${combined} shares across ${known} of ${total} members.',
			'transactions.pageTitle' => 'Transactions',
			'transactions.reportButton' => 'Report (PDF)',
			'transactions.addButton' => 'Add transaction',
			'transactions.loadError' => 'Could not load transactions.',
			'transactions.empty' => 'No transactions yet. Use “Add transaction” to record a transfer.',
			'transactions.colReference' => 'Reference',
			'transactions.colCompany' => 'Company',
			'transactions.colTransferType' => 'Transfer type',
			'transactions.colDate' => 'Date',
			'transactions.reportGenerated' => ({required Object bytes, required Object time}) => 'Transaction report generated (PDF, ${bytes} bytes) at ${time}.',
			'transactions.reportFailed' => 'Could not generate the report.',
			'transactions.addTitle' => 'Add a transfer',
			'transactions.addSubtitle' => 'Transfer only (TR-003). Additional subscriptions are not processed here.',
			'transactions.sectionCommon' => 'Common details',
			'transactions.sectionLines' => 'Transfer details — transferor → transferee',
			'transactions.fieldCompany' => 'Company *',
			'transactions.fieldDate' => 'Transaction date * (YYYY-MM-DD)',
			'transactions.fieldSrf' => 'Request reference (SRF no.)',
			'transactions.fieldTransferType' => 'Transfer type *',
			'transactions.fieldRemarks' => 'Remarks (optional)',
			'transactions.exceptionCheckbox' => 'Override / void (needs a 2nd approval by the Team Leader)',
			'transactions.fieldFrom' => 'From (transferor) *',
			'transactions.fieldTo' => 'To (transferee) *',
			'transactions.fieldShareClass' => 'Share class *',
			'transactions.fieldShares' => 'Shares *',
			'transactions.fieldCertificate' => 'Certificate *',
			'transactions.addLine' => 'Add line',
			'transactions.removeLine' => 'Remove line',
			'transactions.submitTransaction' => 'Submit transaction',
			'transactions.footNote' => 'Shares are conserved (transferor decrease = transferee increase; cannot exceed held). Submitting routes to a 1st Level Approver (SL-004). Every action is audited.',
			'transactions.dateFormatError' => 'Use YYYY-MM-DD',
			'transactions.sharesMinError' => 'Must be ≥ 1',
			'transactions.createError' => 'Could not create the transfer. Check your permissions and inputs.',
			'transactions.backToList' => 'Back to transactions',
			'transactions.loadDetailError' => 'Could not load the transaction.',
			'transactions.noActions' => 'No actions available for your role in this state.',
			'transactions.submitForApproval' => 'Submit for approval',
			'transactions.approve' => 'Approve',
			'transactions.approveSecondLevel' => 'Approve (2nd level)',
			'transactions.reject' => 'Reject',
			'transactions.markPrinted' => 'Mark printed → post',
			'transactions.reasonRequired' => 'Reason (required)',
			'transactions.reasonOptional' => 'Reason (optional)',
			'transactions.reasonHint' => 'Enter a note for the audit trail',
			'transactions.actionSuccessAt' => ({required Object message, required Object time}) => '${message} at ${time}.',
			'transactions.actionForbidden' => 'Your role may not perform this action.',
			'transactions.actionInvalidState' => 'That action is not allowed in the current state, or a reason is required.',
			'transactions.actionFailed' => 'Action failed. Please try again.',
			'transactions.breakdownTitle' => 'Share breakdown (computed)',
			'transactions.linesTitle' => 'Transfer lines',
			'transactions.approvalsTitle' => 'Approval history',
			'transactions.noApprovals' => 'Not yet submitted for approval.',
			'transactions.metaCompany' => 'Company',
			'transactions.metaDate' => 'Date',
			'transactions.metaSrf' => 'SRF',
			'transactions.metaType' => 'Type',
			'transactions.metaException' => 'Exception',
			'transactions.metaPostedAt' => 'Posted at',
			'transactions.remarksPrefix' => ({required Object remarks}) => 'Remarks: ${remarks}',
			'transactions.statusSubmitted' => 'Submitted',
			'transactions.statusPendingFirstApproval' => 'Pending 1st approval',
			'transactions.statusPendingSecondApproval' => 'Pending 2nd approval',
			'transactions.statusApproved' => 'Approved',
			'transactions.statusPosted' => 'Posted',
			'transactions.statusRejected' => 'Rejected',
			'certificates.numberingBreadcrumb' => 'Settings › Stock certificate configuration',
			'certificates.numberingTitle' => 'Certificate numbering',
			'certificates.numberingDescription' => 'Set the starting point per share class. Each class and its replacement sequence are independent (SL-002, TR-004).',
			'certificates.companyLabel' => 'Company',
			'certificates.loadingSequences' => 'Loading certificate sequences…',
			'certificates.loadSequencesError' => 'Could not load the sequences.',
			'certificates.noShareClasses' => 'This company has no share classes yet. Define them in Maintenance › Company shares (MDM-003) first.',
			'certificates.colShareClass' => 'Share class',
			'certificates.colSequence' => 'Sequence',
			'certificates.colStartingNumber' => 'Starting number',
			'certificates.colNextNumber' => 'Next number',
			'certificates.colNumberingMode' => 'Numbering mode',
			'certificates.originalIssuance' => 'Original issuance',
			'certificates.replacementSeparate' => 'Replacement (separate)',
			'certificates.footNote' => 'Numbers run on without gaps and are never reused (S3-Q7, TR-004). A starting point can be set until its first certificate is issued. Manual numbers need Team Leader approval (TR-018).',
			'certificates.editDialogTitle' => ({required Object stockType}) => 'Edit numbering · ${stockType}',
			'certificates.sectionStartingPoints' => 'Starting points (SL-002)',
			'certificates.fieldOriginalStart' => 'Original issuance · starting number',
			'certificates.fieldReplacementStart' => 'Replacement (separate) · starting number',
			'certificates.sectionNumberingMode' => 'Numbering mode',
			'certificates.modeLabel' => 'Mode',
			'certificates.modeHelper' => 'Manual (pre-printed stock, e.g. VECO): every print needs a Team Leader to confirm the number on the pre-printed form.',
			'certificates.confirmStartTitle' => 'Set the starting point?',
			'certificates.setStartingPoint' => 'Set starting point',
			'certificates.saveConfiguration' => 'Save configuration',
			'certificates.printBreadcrumb' => 'Transactions › Print certificates',
			'certificates.printTitle' => 'Print certificates',
			'certificates.printDescription' => 'Print approved transactions on a pre-printed form or the system template. Numbers come from each share class sequence (TR-017, TR-018).',
			'certificates.transactionsToPrint' => 'Transactions to print',
			'certificates.sampleDataNote' => 'Sample data (Wave 1)',
			'certificates.colReference' => 'Reference',
			'certificates.colCompany' => 'Company',
			'certificates.colDetails' => 'Details',
			'certificates.onlyApprovedTooltip' => 'Only approved transactions can be printed',
			'certificates.printTooltip' => ({required Object id}) => 'Print ${id}',
			'certificates.printDialogTitle' => ({required Object id}) => 'Print certificates · ${id}',
			'certificates.sectionPrintOption' => 'Print option (TR-017)',
			'certificates.sectionCertificateNumber' => 'Certificate number (TR-018)',
			'certificates.autoNumberHint' => 'Numbers are assigned automatically from the share class sequence.',
			'certificates.useManualNumber' => 'Use a manual number instead (Team Leader approval)',
			'certificates.manualNumberField' => 'Manual certificate number',
			'certificates.manualNumberHelper' => 'Must be the next number in the sequence (no gaps). Use it to confirm the number on a pre-printed form, e.g. 500.',
			'certificates.teamLeaderApprovalCheckbox' => 'I am the Team Leader and I approve this number',
			'certificates.teamLeaderApprovalHelper' => 'The server checks your role; other roles are refused and the attempt is recorded.',
			'certificates.print' => 'Print',
			'certificates.printing' => 'Printing…',
			'certificates.certificatesFor' => ({required Object id}) => 'Certificates · ${id}',
			'certificates.downloadPdf' => 'Download PDF',
			'certificates.preparingPdf' => 'Preparing PDF…',
			'certificates.loadingCertificates' => 'Loading certificates…',
			'certificates.noCertificatesYet' => ({required Object id}) => 'No certificates printed for ${id} yet. Use Print to assign numbers.',
			'certificates.colCertNo' => 'Cert no.',
			'certificates.colHolderStockholder' => 'Stockholder',
			'certificates.colSharesCount' => 'No. of shares',
			'certificates.downloadSuccess' => ({required Object id, required Object time, required Object size}) => 'PDF for ${id} downloaded at ${time} (${size} KB).',
			'certificates.downloadUnsupported' => ({required Object id}) => 'The PDF for ${id} was generated, but this platform cannot save files. Use the web app.',
			'certificates.downloadError' => 'Could not download the PDF. Try again.',
			'certificates.printReadySuccess' => ({required Object count, required Object id, required Object time, required Object numbers}) => '${count} certificate(s) ready for ${id} at ${time}: ${numbers}. Download the PDF to print them.',
			'certificates.loadCertificatesError' => ({required Object id}) => 'Could not load the certificates for ${id}. Try again.',
			_ => null,
		};
	}
}
