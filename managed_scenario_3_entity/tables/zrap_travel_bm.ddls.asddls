@EndUserText.label : '/DMO/Travel BM'
@AbapCatalog.enhancement.category : #NOT_EXTENSIBLE
@AbapCatalog.tableCategory : #TRANSPARENT
@AbapCatalog.deliveryClass : #A
@AbapCatalog.dataMaintenance : #RESTRICTED
define table zrap_travel_bm {
  key client     : abap.clnt not null;
  key travel_id  : /dmo/travel_id not null;
  agency_id      : /dmo/agency_id;
  customer_id    : /dmo/customer_id;
  begin_date     : /dmo/begin_date;
  end_date       : /dmo/end_date;
  @Semantics.amount.currencyCode : '/dmo/travel_data.currency_code'
  booking_fee    : /dmo/booking_fee;
  booking_status : /dmo/booking_status;
  @Semantics.amount.currencyCode : '/dmo/travel_data.currency_code'
  total_price    : /dmo/total_price;
  currency_code  : /dmo/currency_code;
  description    : /dmo/description;
  status         : /dmo/travel_status;
  createdby      : syuname;
  createdat      : timestampl;
  lastchangedby  : syuname;
  lastchangedat  : timestampl;

}