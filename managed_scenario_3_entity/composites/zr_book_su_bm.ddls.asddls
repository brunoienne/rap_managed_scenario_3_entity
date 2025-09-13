@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Composite Booking Supplements BM'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zr_book_su_bm
  as select from zi_book_su_bm
  association to parent zr_booking_bm as _Booking on  $projection.TravelId  = _Booking.TravelId
                                                  and $projection.BookingId = _Booking.BookingId
  association to zr_travel_bm         as _Travel  on  $projection.TravelId = _Travel.TravelId
{
  key travel_id             as TravelId,
  key booking_id            as BookingId,
  key booking_supplement_id as BookingSupplementId,
      supplement_id         as SupplementId,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                 as Price,
      currency_code         as CurrencyCode,
      _Booking,
      _Travel
}
