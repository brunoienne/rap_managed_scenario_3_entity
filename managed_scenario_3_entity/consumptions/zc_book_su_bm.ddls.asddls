@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption to Booking Supplements BM'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity zc_book_su_bm
  as projection on zr_book_su_bm
{
  key TravelId,
  key BookingId,
  key BookingSupplementId,
      SupplementId,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Price,
      CurrencyCode,
      /* Associations */
      _Booking : redirected to parent zc_booking_bm,
      _Travel  : redirected to zc_travel_bm
}
