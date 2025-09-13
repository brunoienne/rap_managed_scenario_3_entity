CLASS lhc_zr_booking_bm DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS earlynumbering_cba_booking_sup FOR NUMBERING
      IMPORTING entities FOR CREATE zr_booking_bm\_booking_suppl.

ENDCLASS.

CLASS lhc_zr_booking_bm IMPLEMENTATION.

  METHOD earlynumbering_cba_booking_sup.

    "Busca os Booking Supplement existentes para descobrir o maior ID
    READ ENTITIES OF zr_travel_bm IN LOCAL MODE
      ENTITY zr_booking_bm BY \_booking_suppl
      FROM CORRESPONDING #( entities )
      LINK DATA(lt_linked_data).

    DATA(lv_id) = REDUCE #( INIT lv_maximo = CONV /dmo/booking_supplement_id( '0' )
                          FOR ls_linked_data IN lt_linked_data
                           NEXT lv_maximo = COND #( WHEN lv_maximo < ls_linked_data-target-bookingsupplementid THEN ls_linked_data-target-bookingsupplementid ELSE lv_maximo ) ).

    "Para cada novo Booking Supplement (%target) incrementa o último ID e adiciona na estrutura mapped
    LOOP AT entities ASSIGNING FIELD-SYMBOL(<fl_entity>).
      LOOP AT <fl_entity>-%target ASSIGNING FIELD-SYMBOL(<fl_booking_su>).
        APPEND CORRESPONDING #( <fl_booking_su> ) TO mapped-zr_book_su_bm ASSIGNING FIELD-SYMBOL(<fl_mapped>).
        IF <fl_mapped> IS ASSIGNED AND <fl_mapped>-bookingsupplementid IS INITIAL.
          <fl_mapped>-bookingsupplementid = lv_id + 1.
        ENDIF.
      ENDLOOP.
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.