@Metadata.layer: #CORE
@UI.headerInfo: {
    typeName: 'Reserva',
    typeNamePlural: 'Reservas'
}
annotate view zc_booking_bm with
{
  @UI.facet: [{
       id: 'Reserva',
       purpose: #STANDARD,
       position: 10,
       label: 'Reserva',
       type: #IDENTIFICATION_REFERENCE
   },
   {
       id: 'SuplementoReserva',
       purpose: #STANDARD,
       position: 10,
       label: 'Suplemento de Reserva',
       type: #LINEITEM_REFERENCE,
       targetElement: '_Booking_Suppl'
   }]

  @UI:{
  lineItem: [{ position: 10 }],
  selectionField: [{ position: 10 }],
  identification: [{ position: 10, label: 'Travel ID'}]
  }
  @Consumption: {
      valueHelpDefinition: [{
          entity: {
              name: '/DMO/I_Travel_M',
              element: 'travel_id'
          }
      }]
  }
  TravelId;
  @UI:{
  lineItem: [{ position: 20 }],
  identification: [{ position: 20, label: 'Booking ID' }]
  }
  BookingId;
  @UI:{
  lineItem: [{ position: 30 }],
  identification: [{ position: 30, label: 'Booking Date' }]
  }
  BookingDate;
  @UI:{
  lineItem: [{ position: 40 }],
  identification: [{ position: 40, label: 'Customer ID' }]
  }
  @Consumption: {
      valueHelpDefinition: [{
          entity: {
              name: '/DMO/I_Customer',
              element: 'CustomerID'
          }
      }]
  }
  CustomerId;
  @UI:{
  lineItem: [{ position: 50 }],
  identification: [{ position: 50, label: 'Carrier ID' }]
  }
  CarrierId;
  @UI:{
  lineItem: [{ position: 60 }],
  identification: [{ position: 60, label: 'Connection ID' }]
  }
  @Consumption: {
      valueHelpDefinition: [{
          entity: {
              name: '/DMO/I_Connection',
              element: 'ConnectionID'
          }
      }]
  }
  ConnectionId;
  @UI:{
  lineItem: [{ position: 70 }],
  identification: [{ position: 70, label: 'Flight ID' }]
  }
  FlightDate;
  @UI:{
  lineItem: [{ position: 80 }],
  identification: [{ position: 80, label: 'Flight Price' }]
  }
  FlightPrice;
  @UI:{
  lineItem: [{ position: 90 }],
  identification: [{ position: 90, label: 'Currency Code' }]
  }
  @Consumption: {
      valueHelpDefinition: [{
          entity: {
              name: 'I_Currency',
              element: 'Currency'
          }
      }]
  }
  CurrencyCode;
  @UI:{
  lineItem: [{ position: 100 }],
  identification: [{ position: 100, label: 'Booking Status' }]
  }
  booking_status;

}