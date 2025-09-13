managed;
strict ( 2 );

define behavior for zr_travel_bm implementation in class zbp_r_travel_bm unique //alias <alias_name>
persistent table zrap_travel_bm
lock master
authorization master ( instance )
early numbering
//etag master <field_name>
{
  field ( readonly ) TravelId;
  create;
  update;
  delete;
  association _Booking { create; }
  mapping for ZRAP_TRAVEL_BM
  {
    TravelId = travel_id;
    AgencyId = agency_id;
    CustomerId = customer_id;
    BeginDate = begin_date;
    EndDate = end_date;
    BookingFee = booking_fee;
    TotalPrice = total_price;
    CurrencyCode = currency_code;
    Description = description;
    Status = status;
    Createdby = createdby;
    Createdat = createdat;
    Lastchangedby = lastchangedby;
    Lastchangedat = lastchangedat;
  }
}

define behavior for zr_booking_bm implementation in class zbp_r_booking_bm unique //alias <alias_name>
persistent table zrap_booking_bm
early numbering
lock dependent by _Travel
authorization dependent by _Travel
//etag master <field_name>
{
  update;
  delete;
  field ( readonly ) TravelId, BookingId;
  association _Travel;
  association _Booking_Suppl { create; }
  mapping for ZRAP_BOOKING_BM
  {
    BookingDate = booking_date;
    BookingId = booking_id;
    CarrierId = carrier_id;
    ConnectionId = connection_id;
    CurrencyCode = currency_code;
    CustomerId = customer_id;
    FlightDate = flight_date;
    FlightPrice = flight_price;
    TravelId = travel_id;
    booking_status = booking_status;
  }
}

define behavior for zr_book_su_bm implementation in class zbp_r_book_su_bm unique //alias <alias_name>
persistent table zrap_book_su_bm
lock dependent by _Travel
authorization dependent by _Travel
early numbering
//etag master <field_name>
{
  update;
  delete;
  field ( readonly ) TravelId, BookingId;
  mapping for zrap_book_su_bm
  {
    BookingId = booking_id;
    BookingSupplementId = booking_supplement_id;
    CurrencyCode = currency_code;
    Price = price;
    SupplementId = supplement_id;
    TravelId = travel_id;
  }
  association _Travel;
  association _Booking;
}