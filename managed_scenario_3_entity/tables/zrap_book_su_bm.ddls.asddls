@EndUserText.label : '/DMO/BookingSup BM'
@AbapCatalog.enhancement.category : #NOT_EXTENSIBLE
@AbapCatalog.tableCategory : #TRANSPARENT
@AbapCatalog.deliveryClass : #A
@AbapCatalog.dataMaintenance : #RESTRICTED
define table zrap_book_su_bm {
  key client                : abap.clnt not null;
  @AbapCatalog.foreignKey.label : 'Travel'
  @AbapCatalog.foreignKey.screenCheck : false
  key travel_id             : /dmo/travel_id not null
    with foreign key [0..*,1] zrap_travel_bm
      where travel_id = zrap_book_su_bm.travel_id;
  @AbapCatalog.foreignKey.label : 'Booking'
  @AbapCatalog.foreignKey.screenCheck : false
  key booking_id            : /dmo/booking_id not null
    with foreign key [0..*,1] zrap_booking_bm
      where travel_id = zrap_book_su_bm.travel_id
        and booking_id = zrap_book_su_bm.booking_id;
  key booking_supplement_id : /dmo/booking_supplement_id not null;
  supplement_id             : /dmo/supplement_id;
  @Semantics.amount.currencyCode : '/dmo/book_suppl_data.currency_code'
  price                     : /dmo/supplement_price;
  currency_code             : /dmo/currency_code;

}