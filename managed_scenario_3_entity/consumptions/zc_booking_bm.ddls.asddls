@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption to Booking BM'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity zc_booking_bm
  as projection on zr_booking_bm
{
  key TravelId,
  key BookingId,
      BookingDate,
      CustomerId,
      CarrierId,
      ConnectionId,
      FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      CurrencyCode,
      booking_status,
      /* Associations */
      _BookingStatus,
      _Booking_Suppl : redirected to composition child zc_book_su_bm,
      _Carrier,
      _Connection,
      _Customer,
      _Travel        : redirected to parent zc_travel_bm
}
