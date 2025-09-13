projection;
strict ( 2 );

define behavior for zc_travel_bm //alias <alias_name>
{
  use create;
  use update;
  use delete;

  use association _Booking { create; }
}

define behavior for zc_booking_bm //alias <alias_name>
{
  use update;
  use delete;

  use association _Travel;
  use association _Booking_Suppl { create; }
}

define behavior for zc_book_su_bm //alias <alias_name>
{
  use update;
  use delete;

  use association _Travel;
  use association _Booking;
}