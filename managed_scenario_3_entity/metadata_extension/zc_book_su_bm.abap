@Metadata.layer: #CORE
@UI.headerInfo: {
    typeName: 'Suplemento de Reserva',
    typeNamePlural: 'Suplementos de Reserva'
}
annotate entity zc_book_su_bm with
{
  @UI.facet: [{
       id: 'SuplementoReserva',
       purpose: #STANDARD,
       position: 10,
       label: 'Suplemento de Reserva',
       type: #IDENTIFICATION_REFERENCE
   }]

  @UI: {
  lineItem: [{ position: 10 }],
  identification: [{ position: 10}]
   }
  TravelId;
  @UI: {
  lineItem: [{ position: 20 }],
  identification: [{ position: 20}]
  }
  BookingId;
  @UI: {
  lineItem: [{ position: 30 }],
  identification: [{ position: 30 }]
  }
  BookingSupplementId;
  @UI: {
  lineItem: [{ position: 40 }],
  identification: [{ position: 40 }]
  }
  @Consumption: {
      valueHelpDefinition: [{
          entity: {
              name: '/DMO/I_Supplement',
              element: 'SupplementID'
          }
      }]
  }
  SupplementId;
  @UI: {
  lineItem: [{ position: 50 }],
  identification: [{ position: 50 }]
  }
  Price;
  @UI: {
  lineItem: [{ position: 60 }],
  identification: [{ position: 60 }]
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

}