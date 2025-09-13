CLASS zcl_populate DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_populate IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: lt_aux  TYPE TABLE OF zrap_booking_bm,
          lt_aux2 TYPE TABLE OF /dmo/booking.

*    SELECT *  FROM /dmo/travel INTO TABLE lt_aux2.
*    MOVE-CORRESPONDING lt_aux2[] TO lt_aux[].
*    MODIFY zrap_travel_bm FROM TABLE lt_aux.

    IF sy-subrc IS INITIAL.
      COMMIT WORK.
    ELSE.
      ROLLBACK WORK.
    ENDIF.

    SELECT *  FROM /dmo/booking INTO TABLE lt_aux2.
    MOVE-CORRESPONDING lt_aux2[] TO lt_aux[].
    MODIFY zrap_booking_bm FROM TABLE lt_aux.

*    INSERT zrap_booking_bm FROM ( SELECT *
*    FROM /dmo/booking EXCEPT ).

    IF sy-subrc IS INITIAL.
      COMMIT WORK.
    ELSE.
      ROLLBACK WORK.
    ENDIF.

    INSERT zrap_book_su_bm FROM ( SELECT *
    FROM /dmo/book_suppl ).

    IF sy-subrc IS INITIAL.
      COMMIT WORK.
    ELSE.
      ROLLBACK WORK.
    ENDIF.


  ENDMETHOD.
ENDCLASS.