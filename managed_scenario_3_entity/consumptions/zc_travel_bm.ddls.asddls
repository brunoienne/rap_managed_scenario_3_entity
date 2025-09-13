@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption to Travel BM'
@Metadata.allowExtensions: true
define root view entity zc_travel_bm
  provider contract transactional_query
  as projection on zr_travel_bm
{
  key TravelId,
      AgencyId,
      CustomerId,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      CurrencyCode,
      Description,
      Status,
      Createdby,
      Createdat,
      Lastchangedby,
      Lastchangedat,
      /* Associations */
      _Agency,
      _Booking : redirected to composition child zc_booking_bm,
      _Currency,
      _Customer,
      _Status
}
