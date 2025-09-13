CLASS lhc_zr_travel_bm DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zr_travel_bm RESULT result.

    METHODS earlynumbering_create FOR NUMBERING
      IMPORTING entities FOR CREATE zr_travel_bm.

    METHODS earlynumbering_cba_booking FOR NUMBERING
      IMPORTING entities FOR CREATE zr_travel_bm\_booking.

ENDCLASS.

CLASS lhc_zr_travel_bm IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD earlynumbering_create.

    SELECT SINGLE MAX( travel_id )
     FROM zrap_travel_bm
     INTO @DATA(lv_max_id).

    lv_max_id += 1.

    LOOP AT entities INTO DATA(ls_entity).
      ls_entity-travelid = lv_max_id.
      APPEND CORRESPONDING #( ls_entity ) TO mapped-zr_travel_bm.
    ENDLOOP.

  ENDMETHOD.

  METHOD earlynumbering_cba_booking.

    "Busca os Booking existentes para descobrir o maior ID
    READ ENTITIES OF zr_travel_bm IN LOCAL MODE
      ENTITY zr_travel_bm BY \_booking
      FROM CORRESPONDING #( entities )
      LINK DATA(lt_linked_data).

    DATA(lv_id) = REDUCE #( INIT lv_maximo = CONV /dmo/booking_id( '0' )
                          FOR ls_linked_data IN lt_linked_data
                           NEXT lv_maximo = COND #( WHEN lv_maximo < ls_linked_data-target-bookingid THEN ls_linked_data-target-bookingid ELSE lv_maximo ) ).

    "Para cada novo Booking (%target) incrementa o último ID e adiciona na estrutura mapped
    LOOP AT entities ASSIGNING FIELD-SYMBOL(<fl_entity>).
      LOOP AT <fl_entity>-%target ASSIGNING FIELD-SYMBOL(<fl_booking>).
        APPEND CORRESPONDING #( <fl_booking> ) TO mapped-zr_booking_bm ASSIGNING FIELD-SYMBOL(<fl_mapped>).
        IF <fl_mapped> IS ASSIGNED AND <fl_mapped>-bookingid IS INITIAL.
          <fl_mapped>-bookingid = lv_id + 1.
        ENDIF.
      ENDLOOP.
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.