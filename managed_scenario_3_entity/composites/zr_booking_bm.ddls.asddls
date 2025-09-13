@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Composite Travel BM'
@Metadata.ignorePropagatedAnnotations: true
define view entity zr_booking_bm
  as select from zi_booking_bm
  composition [0..*] of zr_book_su_bm            as _Booking_Suppl
  association        to parent zr_travel_bm             as _Travel on  $projection.TravelId = _Travel.TravelId
  association [1..1] to /DMO/I_Carrier           as _Carrier       on  $projection.CarrierId = _Carrier.AirlineID
  association [1..1] to /DMO/I_Customer          as _Customer      on  $projection.CustomerId = _Customer.CustomerID
  association [1..1] to /DMO/I_Connection        as _Connection    on  $projection.ConnectionId = _Connection.ConnectionID
                                                                   and $projection.CarrierId    = _Connection.AirlineID
  association [0..1] to /DMO/I_Booking_Status_VH as _BookingStatus on  $projection.booking_status = _BookingStatus.BookingStatus
{
  key travel_id     as TravelId,
  key booking_id    as BookingId,
      booking_date  as BookingDate,
      customer_id   as CustomerId,
      carrier_id    as CarrierId,
      connection_id as ConnectionId,
      flight_date   as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price  as FlightPrice,
      currency_code as CurrencyCode,
      booking_status,
      _Travel,
      _Carrier,
      _Customer,
      _Connection,
      _BookingStatus,
      _Booking_Suppl
}
