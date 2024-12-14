import gleam/option.{type Option}
import gleam/string
import tempo.{type DateTime}

pub type PositiveInt =
  Int

pub fn is_positve_int(number: Int) -> PositiveInt {
  case number {
    _ if number >= 0 -> number
    _ -> 0
  }
}

pub type MessageTypeID {
  Call
  CallResult
  CallError
}

pub fn message_type_to_string(message_type: MessageTypeID) -> String {
  case message_type {
    Call -> "CALL"
    CallResult -> "CALLRESULT"
    CallError -> "CALLERROR"
  }
}

pub fn message_type_to_int(message_type: MessageTypeID) -> Int {
  case message_type {
    Call -> 2
    CallError -> 3
    CallResult -> 4
  }
}

pub type MessageID =
  String

pub type ErrorCode {
  NotImplemented
  NotSupported
  InternalError
  ProtocolError
  SecurityError
  FormationViolation
  PropertyConstraintViolation
  OccurenceConstraintViolation
  TypeConstraintViolation
  GenericError
}

pub type MessageType {
  CallMessage(
    message_type: MessageTypeID,
    message_id: MessageID,
    action: String,
    payload: String,
  )
  CallResultMessage(
    message_type: MessageTypeID,
    message_id: MessageID,
    payload: String,
  )
  CallErrorMessage(
    message_type: MessageTypeID,
    message_id: MessageID,
    error_code: ErrorCode,
    error_description: String,
    error_details: String,
  )
}

pub type CIString =
  String

pub fn compare_ci_string(from: CIString, to: CIString) -> Bool {
  string.lowercase(from) == string.lowercase(to)
}

pub type CIString20 =
  CIString

pub fn is_ci_string_20(ci_string: CIString) -> Bool {
  string.length(ci_string) <= 20
}

pub type CIString25 =
  CIString

pub fn is_ci_string_25(ci_string: CIString) -> Bool {
  string.length(ci_string) <= 25
}

pub type CIString50 =
  CIString

pub fn is_ci_string_50(ci_string: CIString) -> Bool {
  string.length(ci_string) <= 50
}

pub type CIString255 =
  CIString

pub fn is_ci_string_255(ci_string: CIString) -> Bool {
  string.length(ci_string) <= 255
}

pub type CIString500 =
  CIString

pub fn is_ci_string_500(ci_string: CIString) -> Bool {
  string.length(ci_string) <= 500
}

pub type IDToken =
  CIString

pub type IDTagInfo {
  IDTagInfo(
    expire_date: Option(DateTime),
    parent_id_tag: Option(IDToken),
    status: AuthorizationStatus,
  )
}

pub type AuthorizationStatus {
  AuthorizationAccepted
  AuthorizationBlocked
  AuthorizationExpired
  AuthorizationInvalid
  AuthorizationConcurrentTx
}

pub fn authorize_status_to_string(status: AuthorizationStatus) -> String {
  case status {
    AuthorizationAccepted -> "Accepted"
    AuthorizationBlocked -> "Blocked"
    AuthorizationConcurrentTx -> "ConcurrentTx"
    AuthorizationExpired -> "Expired"
    AuthorizationInvalid -> "Invalid"
  }
}

pub type RegistrationStatus {
  RegistrationStatusAccepted
  RegistrationStatusPending
  RegistrationStatusRejected
}

pub fn registration_status_to_string(status: RegistrationStatus) -> String {
  case status {
    RegistrationStatusAccepted -> "Accepted"
    RegistrationStatusPending -> "Pending"
    RegistrationStatusRejected -> "Rejected"
  }
}

pub type CancelReservationStatus {
  CancelReservationStatusAccepted
  CancelReservationStatusRejected
}

pub fn cancel_reservation_status_to_string(
  status: CancelReservationStatus,
) -> String {
  case status {
    CancelReservationStatusAccepted -> "Accepted"
    CancelReservationStatusRejected -> "Rejected"
  }
}

pub type AvailabilityType {
  AvailabilityTypeInoperative
  AvailabilityTypeOperative
}

pub fn availability_type_to_string(availability: AvailabilityType) -> String {
  case availability {
    AvailabilityTypeInoperative -> "Inoperative"
    AvailabilityTypeOperative -> "Operative"
  }
}

pub type AvailabilityStatus {
  AvailabilityStatusAccepted
  AvailabilityStatusFaulted
  AvailabilityStatusOccupied
  AvailabilityStatusRejected
  AvailabilityStatusUnavailable
}

pub fn availability_status_to_string(status: AvailabilityStatus) -> String {
  case status {
    AvailabilityStatusAccepted -> "Accepted"
    AvailabilityStatusFaulted -> "Faulted"
    AvailabilityStatusOccupied -> "Occupied"
    AvailabilityStatusRejected -> "Rejected"
    AvailabilityStatusUnavailable -> "Unavailable"
  }
}

pub type ConfigurationStatus {
  ConfigurationStatusAccepted
  ConfigurationStatusRejected
  ConfigurationStatusRebootRequired
  ConfigurationStatusNotSupported
}

pub fn configuration_status_to_string(status: ConfigurationStatus) -> String {
  case status {
    ConfigurationStatusAccepted -> "Accepted"
    ConfigurationStatusNotSupported -> "NotSupported"
    ConfigurationStatusRebootRequired -> "RebootRequired"
    ConfigurationStatusRejected -> "Rejected"
  }
}

pub type ClearCacheStatus {
  ClearCahceStatusAccepted
  ClearCacheStatusRejected
}

pub fn clear_cache_status_to_string(status: ClearCacheStatus) -> String {
  case status {
    ClearCacheStatusRejected -> "Rejected"
    ClearCahceStatusAccepted -> "Accepted"
  }
}

pub type ChargingProfilePurpose {
  ChargingProfilePurposeChargePointMaxProfile
  ChargingProfilePurposeTXDefaultProfile
  ChargingProfilePurposeTXProfile
}

pub fn charging_profile_purpose_to_string(
  purpose: ChargingProfilePurpose,
) -> String {
  case purpose {
    ChargingProfilePurposeChargePointMaxProfile -> "ChargingPointMaxProfile"
    ChargingProfilePurposeTXDefaultProfile -> "TxDefaultProfile"
    ChargingProfilePurposeTXProfile -> "TxProfile"
  }
}

pub type ChargingProfileKind {
  ChargingProfileKindAbsoulte
  ChargingProfileKindReccuring
  ChargingProfileKindRelative
}

pub fn charging_profile_kind_to_string(kind: ChargingProfileKind) -> String {
  case kind {
    ChargingProfileKindAbsoulte -> "Absoulte"
    ChargingProfileKindReccuring -> "Reccuring"
    ChargingProfileKindRelative -> "Relative"
  }
}

pub type ClearChargingProfileStatus {
  ClearChargingProfileStatusAccepted
  ClearChargingProfileStatusUnknown
}

pub fn charging_profile_status_to_string(
  status: ClearChargingProfileStatus,
) -> String {
  case status {
    ClearChargingProfileStatusAccepted -> "Accepted"
    ClearChargingProfileStatusUnknown -> "Unknown"
  }
}

pub type DataTransferStatus {
  DataTransferStatusAccepted
  DataTransferStatusRejected
  DataTransferStatusUnknownMessageID
  DataTransferStatusUnknownVendorID
}

pub fn data_transfer_status_to_string(status: DataTransferStatus) -> String {
  case status {
    DataTransferStatusAccepted -> "Accepted"
    DataTransferStatusRejected -> "Rejected"
    DataTransferStatusUnknownMessageID -> "UnknownMessageId"
    DataTransferStatusUnknownVendorID -> "UnknownVendorId"
  }
}

pub type DiagnosticsStatus {
  DiagnosticsStatusIdle
  DiagnosticsStatusUploaded
  DiagnosticsStatusUploadFailed
  DiagnosticsStatusUploading
}

pub fn diagnostics_status_to_string(status: DiagnosticsStatus) -> String {
  case status {
    DiagnosticsStatusIdle -> "Idle"
    DiagnosticsStatusUploadFailed -> "UploadFailed"
    DiagnosticsStatusUploaded -> "Uploaded"
    DiagnosticsStatusUploading -> "Uploading"
  }
}

pub type FirmwareStatus {
  FirmWareStatusDownloaded
  FirmWareStatusDownloadFailed
  FirmWareStatusDownloading
  FirmWareStatusIdle
  FirmWareStatusInstallationFailed
  FirmWareStatusInstalling
  FirmWareStatusInstalled
}

pub fn firmware_status_to_string(status: FirmwareStatus) -> String {
  case status {
    FirmWareStatusDownloaded -> "Downloaded"
    FirmWareStatusDownloadFailed -> "DownloadFailed"
    FirmWareStatusDownloading -> "Downloading"
    FirmWareStatusIdle -> "Idle"
    FirmWareStatusInstallationFailed -> "InstallationFailed"
    FirmWareStatusInstalled -> "Installed"
    FirmWareStatusInstalling -> "Installing"
  }
}

pub type ChargingRateUnit {
  ChargeRateWatt
  ChargeRateAmperes
}

pub fn charge_rate_unit_to_string(unit: ChargingRateUnit) -> String {
  case unit {
    ChargeRateAmperes -> "A"
    ChargeRateWatt -> "W"
  }
}

pub type GetCompositeScheduleStatus {
  GetCompositeScheduleStatusAccepted
  GetCompositeScheduleStatusRejected
}

pub fn get_composite_schedule_status_to_string(
  status: GetCompositeScheduleStatus,
) -> String {
  case status {
    GetCompositeScheduleStatusAccepted -> "Accepted"
    GetCompositeScheduleStatusRejected -> "Rejected"
  }
}

pub type ChargingSchedulePeriod {
  ChargingSchedulePeriod(
    start_period: Int,
    limit: Float,
    number_phases: Option(Int),
  )
}

pub type ChargingSchedule {
  ChargingSchedule(
    duration: Option(Int),
    start_schedule: Option(DateTime),
    charging_rate_unit: ChargingRateUnit,
    charging_schedule_period: List(ChargingSchedulePeriod),
    min_charging_rate: Float,
  )
}

pub type KeyValue {
  KeyValue(key: CIString50, value: CIString50, readonly: Bool)
}

pub type ReadingContext {
  ReadingContextInterruptionBegin
  ReadingContextInterruptionEnd
  ReadingContextOther
  ReadingContextSampleClock
  ReadingContextSamplePeriodic
  ReadingContextTransactionBegin
  ReadingContextTransactionEnd
  ReadingContextTrigger
}

pub fn reading_context_to_string(context: ReadingContext) -> String {
  case context {
    ReadingContextInterruptionBegin -> "Interruption.Begin"
    ReadingContextInterruptionEnd -> "Interruption.End"
    ReadingContextOther -> "Other"
    ReadingContextSampleClock -> "Sample.Clock"
    ReadingContextSamplePeriodic -> "Sample.Periodic"
    ReadingContextTransactionBegin -> "Transaction.Begin"
    ReadingContextTransactionEnd -> "Transaction.End"
    ReadingContextTrigger -> "Trigger"
  }
}

pub type ValueFormat {
  ValueFormatRaw
  ValueFormatSignedData
}

pub fn value_format_to_string(format: ValueFormat) -> String {
  case format {
    ValueFormatRaw -> "Raw"
    ValueFormatSignedData -> "SignedData"
  }
}

pub type Measurand {
  MeasurandCurrentExport
  MeasurandCurrentImport
  MeasurandCurrentOffered
  MeasurandEnergyActiveExportRegister
  MeasurandEnergyActiveImporttRegister
  MeasurandReactiveExportRegister
  MeasurandReactiveImportRegister
  MeasurandActiveExportInterval
  MeasurandActiveImportInterval
  MeasurandReactiveExportInterval
  MeasurandReactiveImportInterval
  MeasurandFrequency
  MeasurandPowerActiveExport
  MeasurandPowerActiveImport
  MeasurandPowerFactor
  MeasurandPowerOffered
  MeasurandPowerReactiveExport
  MeasurandPowerReactiveImport
  MeasurandRPM
  MeasurandSoC
  MeasurandTemperature
  MeasurandVoltage
}

pub fn measurand_to_string(measurand: Measurand) -> String {
  case measurand {
    MeasurandActiveExportInterval -> "ActiveExportInterval"
    MeasurandActiveImportInterval -> "ActiveImportInterval"
    MeasurandCurrentExport -> "CurrentExport"
    MeasurandCurrentImport -> "CurrentImport"
    MeasurandCurrentOffered -> "CurrentOffered"
    MeasurandEnergyActiveExportRegister -> "EnergyActiveExportRegister"
    MeasurandEnergyActiveImporttRegister -> "EnergyActiveImporttRegister"
    MeasurandFrequency -> "Frequency"
    MeasurandPowerActiveExport -> "PowerActiveExport"
    MeasurandPowerActiveImport -> "PowerActiveImport"
    MeasurandPowerFactor -> "PowerFactor"
    MeasurandPowerOffered -> "PowerOffered"
    MeasurandPowerReactiveExport -> "PowerReactiveExport"
    MeasurandPowerReactiveImport -> "PowerReactiveImport"
    MeasurandRPM -> "RPM"
    MeasurandReactiveExportInterval -> "ReactiveExportInterval"
    MeasurandReactiveExportRegister -> "ReactiveExportRegister"
    MeasurandReactiveImportInterval -> "ReactiveImportInterval"
    MeasurandReactiveImportRegister -> "ReactiveImportRegister"
    MeasurandSoC -> "SoC"
    MeasurandTemperature -> "Temperature"
    MeasurandVoltage -> "Voltage"
  }
}

pub type SampledValue {
  SampledValue(
    value: String,
    context: Option(ReadingContext),
    format: Option(ValueFormat),
    meassurand: Option(Measurand),
  )
}

pub type MeterValue {
  MeterValue(timestamp: DateTime, sampled_value: List(SampledValue))
}

pub type RecurrencyKind {
  Daily
  Weekly
}

pub fn recurrency_kind_to_string(kind: RecurrencyKind) -> String {
  case kind {
    Daily -> "Dauly"
    Weekly -> "Weekly"
  }
}

pub type ChargingProfile {
  ChargingProfile(
    charging_profile_id: Int,
    transaction_id: Option(Int),
    // TODO: Should I implement a positive Int Type?
    stack_level: Int,
    charging_profile_purpose: ChargingProfilePurpose,
    charging_profile_kind: ChargingProfileKind,
    recurrency_kind: Option(RecurrencyKind),
    valid_from: Option(DateTime),
    valid_to: Option(DateTime),
    charging_schedule: ChargingSchedule,
  )
}

pub type RemoteStartStopStatus {
  RemoteStartStopStatusAccepted
  RemoteStartStopStatusRejected
}

pub fn remote_start_stop_status_to_string(
  status: RemoteStartStopStatus,
) -> String {
  case status {
    RemoteStartStopStatusAccepted -> "Accepted"
    RemoteStartStopStatusRejected -> "Rejected"
  }
}

pub type ReservationStatus {
  ReservationStatusAccepted
  ReservationStatusFaulted
  ReservationStatusOccupied
  ReservationStatusRejected
  ReservationStatusUnavailable
}

pub fn reservation_status_to_string(status: ReservationStatus) -> String {
  case status {
    ReservationStatusAccepted -> "Accepted"
    ReservationStatusFaulted -> "Faulted"
    ReservationStatusOccupied -> "Occupied"
    ReservationStatusRejected -> "Rejected"
    ReservationStatusUnavailable -> "Unavailable"
  }
}

pub type Reset {
  ResetHard
  ResetSoft
}

pub fn reset_to_string(reset: Reset) -> String {
  case reset {
    ResetHard -> "Hard"
    ResetSoft -> "Soft"
  }
}

pub type ResetStatus {
  ResetStatusAccepted
  ResetStatusRejected
}

pub fn reset_status_to_string(status: ResetStatus) -> String {
  case status {
    ResetStatusAccepted -> "Accepted"
    ResetStatusRejected -> "Rejected"
  }
}

pub type AuthorizationData {
  AuthorizationData(id_tag: IDToken, id_tag_info: Option(IDTagInfo))
}

pub type Update {
  UpdateDifferential
  UpdateFull
}

pub fn update_tp_string(update: Update) -> String {
  case update {
    UpdateDifferential -> "Differential"
    UpdateFull -> "Full"
  }
}

pub type UpdateStatus {
  UpdateStatusAccepted
  UpdateStatusFailed
}

pub fn update_status_to_string(status: UpdateStatus) -> String {
  case status {
    UpdateStatusAccepted -> "Accepted"
    UpdateStatusFailed -> "Failed"
  }
}

pub type ChargingProfileStatus {
  ChargingProfileStatusAccepted
  ChargingProfileStatusReject
  ChargingProfileStatusNotSupported
}

pub fn charging_profile_status(status: ChargingProfileStatus) -> String {
  case status {
    ChargingProfileStatusAccepted -> "Accepted"
    ChargingProfileStatusNotSupported -> "NotSupported"
    ChargingProfileStatusReject -> "Rejected"
  }
}

pub type ChargePointErrorCode {
  ChargePointErrorCodeConnectorLockFailure
  ChargePointErrorCodeEVCommunicationError
  ChargePointErrorCodeGroundFailure
  ChargePointErrorCodeHighTemperature
  ChargePointErrorCodeInternalError
  ChargePointErrorCodeLocalListConflict
  ChargePointErrorCodeNoError
  ChargePointErrorCodeOtherError
  ChargePointErrorCodeOverCurrentFailure
  ChargePointErrorCodeOverVoltage
  ChargePointErrorCodePowerMeterFailure
  ChargePointErrorCodePowerSwitchFailure
  ChargePointErrorCodeReaderFailure
  ChargePointErrorCodeResetFailure
  ChargePointErrorCodeUnderVoltage
  ChargePointErrorCodeWeakSignal
}

pub fn charge_point_error_code_to_string(
  error_code: ChargePointErrorCode,
) -> String {
  case error_code {
    ChargePointErrorCodeConnectorLockFailure -> "ConnectorLockFailure"
    ChargePointErrorCodeEVCommunicationError -> "EVCommunicationError"
    ChargePointErrorCodeGroundFailure -> "GroundFailure"
    ChargePointErrorCodeHighTemperature -> "HighTemperature"
    ChargePointErrorCodeInternalError -> "InternalError"
    ChargePointErrorCodeLocalListConflict -> "LocalListConflict"
    ChargePointErrorCodeNoError -> "NoError"
    ChargePointErrorCodeOtherError -> "OtherError"
    ChargePointErrorCodeOverCurrentFailure -> "OverCurrentFailure"
    ChargePointErrorCodeOverVoltage -> "OverVoltage"
    ChargePointErrorCodePowerMeterFailure -> "PowerMeterFailure"
    ChargePointErrorCodePowerSwitchFailure -> "PowerSwitchFailure"
    ChargePointErrorCodeReaderFailure -> "ReaderFailure"
    ChargePointErrorCodeResetFailure -> "ResetFailure"
    ChargePointErrorCodeUnderVoltage -> "UnderVoltage"
    ChargePointErrorCodeWeakSignal -> "WeakSignal"
  }
}

pub type ChargePointStatus {
  ChargePointStatusAvailable
  ChargePointStatusPreparing
  ChargePointStatusCharging
  ChargePointStatusSuspendedEVSE
  ChargePointStatusSuspendedEV
  ChargePointStatusFinishing
  ChargePointStatusReserved
  ChargePointStatusUnavailable
  ChargePointStatusFaulted
}

pub fn charge_point_status_to_string(status: ChargePointStatus) -> String {
  case status {
    ChargePointStatusAvailable -> "Available"
    ChargePointStatusCharging -> "Charging"
    ChargePointStatusFaulted -> "Faulted"
    ChargePointStatusFinishing -> "Finishing"
    ChargePointStatusPreparing -> "Preparing"
    ChargePointStatusReserved -> "Reserved"
    ChargePointStatusSuspendedEV -> "SuspendedEV"
    ChargePointStatusSuspendedEVSE -> "SuspendedEVSE"
    ChargePointStatusUnavailable -> "Unavailable"
  }
}

pub type Reason {
  ReasonDeAuthorized
  ReasonEmergencyStop
  ReasonEVDisconnected
  ReasonHeadRest
  ReasonLocal
  ReasonOther
  ReasonPowerLoss
  ReasonReboot
  ReasonRemote
  ReasonSoftReset
  ReasonUnlockCommand
}

pub fn reason_to_string(reason: Reason) -> String {
  case reason {
    ReasonDeAuthorized -> "DeAuthorized"
    ReasonEVDisconnected -> "EVDisconnected"
    ReasonEmergencyStop -> "EmergencyStop"
    ReasonHeadRest -> "HeadRest"
    ReasonLocal -> "Local"
    ReasonOther -> "Other"
    ReasonPowerLoss -> "PowerLoss"
    ReasonReboot -> "Reboot"
    ReasonRemote -> "Remote"
    ReasonSoftReset -> "SoftReset"
    ReasonUnlockCommand -> "UnlockCommand"
  }
}

pub type MessageTrigger {
  MessageTriggerBootNotification
  MessageTriggerDiagnosticsStatusNotification
  MessageTriggerFirmwareStatusNotification
  MessageTriggerHeartbeat
  MessageTriggerMeterValues
  MessageTriggerStatusNotification
}

pub fn message_trigger_to_string(message: MessageTrigger) -> String {
  case message {
    MessageTriggerBootNotification -> "BootNotification"
    MessageTriggerDiagnosticsStatusNotification ->
      "DiagnosticsStatusNotification"
    MessageTriggerFirmwareStatusNotification -> "FirmwareStatusNotification"
    MessageTriggerHeartbeat -> "Heartbeat"
    MessageTriggerMeterValues -> "MeterValues"
    MessageTriggerStatusNotification -> "StatusNotification"
  }
}

pub type TriggerMessageStatus {
  TriggerMessageStatusAccepted
  TriggerMessageStatusRejected
  TriggerMessageStatusNotimplemented
}

pub fn trigger_message_status_to_string(status: TriggerMessageStatus) -> String {
  case status {
    TriggerMessageStatusAccepted -> "Accepted"
    TriggerMessageStatusNotimplemented -> "Notimplemented"
    TriggerMessageStatusRejected -> "Rejected"
  }
}

pub type UnlockStatus {
  UnlockStatusUnlocked
  UnlockStatusUnlockFailed
  UnlockStatusNotSupported
}

pub fn unlock_status_to_string(status: UnlockStatus) -> String {
  case status {
    UnlockStatusNotSupported -> "NotSupported"
    UnlockStatusUnlockFailed -> "UnlockFailed"
    UnlockStatusUnlocked -> "Unlocked"
  }
}

pub type Message {
  AuthorizeReq(id_tag: CIString20)
  AuthorizeConf(id_tag_info: IDTagInfo)
  BootNotificationReq(
    charge_box_serial_number: Option(CIString25),
    charge_point_model: CIString20,
    charge_point_serial_number: Option(CIString25),
    charge_point_vendor: CIString20,
    firmware_version: Option(CIString50),
    iccid: Option(CIString20),
    imsi: Option(CIString20),
    meter_serial_number: Option(CIString25),
    meter_type: Option(CIString25),
  )
  BootNotificationConf(
    current_time: DateTime,
    interval: Int,
    status: RegistrationStatus,
  )
  CancelReservationReq(reservation_id: Int)
  CancelReservationConf(status: CancelReservationStatus)
  ChangeAvailabilityReq(connector_id: Int, availability_type: AvailabilityType)
  ChangeAvailabilityConf(status: AvailabilityStatus)
  ChangeConfigurationReq(key: CIString50, value: CIString500)
  ChangeConfigurationConf(status: ConfigurationStatus)
  ClearCacheReq
  ClearCacheConf(status: ClearCacheStatus)
  ClearChargingProfileReq(
    id: Option(Int),
    conntector_id: Option(Int),
    charging_profile_purpose: Option(ChargingProfilePurpose),
    stack_level: Option(Int),
  )
  ClearChargingProfileConf(status: ClearChargingProfileStatus)
  DataTransferReq(
    vendor_id: CIString255,
    message_id: Option(CIString50),
    data: String,
  )
  DataTransferConf(status: DataTransferStatus, data: Option(String))
  DiagnosticsStatusNotificationReq(status: DiagnosticsStatus)
  DiagnosticsStatusNotificationConf
  FirmwareStatusNotificationReq(status: FirmwareStatus)
  FirmwareStatusNotificationConf
  GetCompositeScheduleReq(
    connector_id: Int,
    duration: Int,
    chargin_rate_unit: Option(ChargingRateUnit),
  )
  GetCompositeScheduleConf(
    status: GetCompositeScheduleStatus,
    connector_id: Option(Int),
    schedule_start: Option(DateTime),
    charging_schedule: Option(ChargingSchedule),
  )
  GetConfigurationReq(key: List(CIString50))
  GetConfigurationConf(
    configuration_key: List(KeyValue),
    unknown_key: List(CIString50),
  )
  // FIXME: location: anyURL
  GetDiagnosticsReq(
    location: String,
    retries: Option(Int),
    retry_interval: Option(Int),
    start_time: Option(DateTime),
    stop_time: Option(DateTime),
  )
  GetDiagnosticsConf(filename: Option(CIString255))
  GetLocalListVersionReq
  GetLocalListVersionConf(list_version: Int)
  HeartbeatReq
  HeartbeatConf(current_time: DateTime)
  MeterValuesReq(
    connector_id: PositiveInt,
    transaction_id: List(Int),
    meter_value: List(MeterValue),
  )
  MeterValuesConf
  RemoteStartTransactionReq(
    connector_id: Option(Int),
    id_tag: IDToken,
    charging_profile: Option(ChargingProfile),
  )
  RemoteStartTransactionConf(status: RemoteStartStopStatus)
  RemoteStopTransactionReq(transaction_id: Int)
  RemoteStopTransactionConf(status: RemoteStartStopStatus)
  ReserveNowReq(
    // TODO: Should I implement a positive Int type? 
    connector_id: PositiveInt,
    expire_date: DateTime,
    id_tag: IDToken,
    parent_id_tag: Option(IDToken),
    reservation_id: Int,
  )
  ReserveNowConf(status: ReservationStatus)
  ResetReq(reset_type: Reset)
  ResetConf(status: ResetStatus)
  SendLocalListReq(
    list_version: Int,
    local_authorization_list: List(AuthorizationData),
    update_type: Update,
  )
  SendLocalListConf(status: UpdateStatus)
  SetChargingProfileReq(connector_id: Int, cs_charging_profile: ChargingProfile)
  SetChargingProfileConf(status: ChargingProfileStatus)
  StartTransactionReq(
    connector_id: PositiveInt,
    id_tag: IDToken,
    meter_start: Int,
    reservation_id: Option(Int),
    timestamp: DateTime,
  )
  StartTransactionConf(id_tag_info: IDTagInfo, transaction_id: Int)
  StatusNotificationReq(
    connector_id: PositiveInt,
    error_code: ChargePointErrorCode,
    info: Option(CIString50),
    status: ChargePointStatus,
    timestamp: Option(DateTime),
    vendor_id: Option(CIString20),
    vendor_error_code: Option(CIString50),
  )
  StatusNotificationConf
  StopTransactionReq(
    id_tag: Option(IDToken),
    meter_stop: Int,
    timestamp: DateTime,
    transaction_id: Int,
    reason: Option(Reason),
    transaction_data: Option(MeterValue),
  )
  StopTransactionConf(id_tag_info: Option(IDTagInfo))
  TriggerMessageReq(
    requested_message: MessageTrigger,
    connector_id: Option(PositiveInt),
  )
  TriggerMessageConf(status: TriggerMessageStatus)
  UnlockConnectorReq(connector_id: PositiveInt)
  UnlockConnectorConf(status: UnlockStatus)
  // TODO: Should I implement a AnyURL type? 
  UpdateFirmwareConf(
    location: String,
    retries: Option(Int),
    retrive_date: DateTime,
    retriy_interval: Option(Int),
  )
  UpdateFirmwareReq
}
