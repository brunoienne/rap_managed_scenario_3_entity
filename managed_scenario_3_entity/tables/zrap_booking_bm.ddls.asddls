@EndUserText.label : '/DMO/Booking BM'
@AbapCatalog.enhancement.category : #NOT_EXTENSIBLE
@AbapCatalog.tableCategory : #TRANSPARENT
@AbapCatalog.deliveryClass : #A
@AbapCatalog.dataMaintenance : #RESTRICTED
define table zrap_booking_bm {
  key client     : abap.clnt not null;
  @AbapCatalog.foreignKey.label : 'Travel'
  @AbapCatalog.foreignKey.screenCheck : false
  key travel_id  : /dmo/travel_id not null
    with foreign key [0..*,1] zrap_travel_bm
      where travel_id = zrap_booking_bm.travel_id;
  key booking_id : /dmo/booking_id not null;
  booking_date   : /dmo/booking_date;
  booking_status : /dmo/booking_status;
  customer_id    : /dmo/customer_id;
  carrier_id     : /dmo/carrier_id;
  connection_id  : /dmo/connection_id;
  flight_date    : /dmo/flight_date;
  @Semantics.amount.currencyCode : '/dmo/booking_data.currency_code'
  flight_price   : /dmo/flight_price;
  currency_code  : /dmo/currency_code;

}