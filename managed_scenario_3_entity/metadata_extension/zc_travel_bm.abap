@Metadata.layer: #CORE
@UI.headerInfo: {
    typeName: 'Viagem',
    typeNamePlural: 'Viagens'
}
annotate view zc_travel_bm with
{
  @UI.facet: [{
      id: 'Viagem',
      purpose: #STANDARD,
      position: 10,
      label: 'Viagem',
      type: #IDENTIFICATION_REFERENCE
  },
  {
      id: 'Reserva',
      purpose: #STANDARD,
      position: 10,
      label: 'Reserva',
      type: #LINEITEM_REFERENCE,
      targetElement: '_Booking'
  }]

  @UI: {
  lineItem: [{ position: 10 }, { type: #FOR_ACTION, dataAction:'copia', label:'Copiar Travel' }],
  selectionField: [{ position: 10 }],
  identification: [{
      position: 10,
      label: 'Travel Id'
  }]
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
  @UI: {
  lineItem: [{ position: 20 }],
  selectionField: [{ position: 20 }],
  identification: [{
      position: 20,
      label: 'Agency Id'
  }]
  }
  @Consumption: {
      valueHelpDefinition: [{
          entity: {
              name: '/DMO/I_Agency',
              element: 'AgencyID'
          }
      }]
  }
  AgencyId;
  @UI: {
  lineItem: [{ position: 30 }],
  identification: [{
      position: 30,
      label: 'Customer Id'
  }]
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
  @UI: {
  lineItem: [{ position: 40 }],
  identification: [{
      position: 40,
      label: 'Begin Date'
  }]
  }
  BeginDate;
  @UI: {
  lineItem: [{ position: 50 }],
  identification: [{
      position: 50,
      label: 'End Date'
  }]
  }
  EndDate;
  @UI: {
  lineItem: [{ position: 60 }],
  identification: [{
      position: 60,
      label: 'Booking Fee'
  }]
  }
  BookingFee;
  @UI: {
  lineItem: [{ position: 70 }],
  identification: [{
      position: 70,
      label: 'Total Price'
  }]
  }
  TotalPrice;
  @UI: {
  lineItem: [{ position: 80 }],
  identification: [{
      position: 80,
      label: 'Currency Code'
  }]
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
  @UI: {
  lineItem: [{ position: 90 }],
  identification: [{
      position: 90,
      label: 'Description'
  }]
  }
  Description;
  @UI: {
  lineItem: [{ position: 100 }],
  identification: [{
      position: 100,
      label: 'Status'
  }]
  }
  Status;
  @UI: {
  lineItem: [{ position: 110 }],
  identification: [{
      position: 110,
      label: 'Created By'
  }]
  }
  Createdby;
  @UI: {
  lineItem: [{ position: 120 }],
  identification: [{
      position: 120,
      label: 'Create Date'
  }]
  }
  Createdat;
  @UI: {
  lineItem: [{ position: 130 }],
  identification: [{
      position: 130,
      label: 'Last Changed By'
  }]
  }
  Lastchangedby;
  @UI: {
  lineItem: [{ position: 140 }],
  identification: [{
      position: 140,
      label: 'Last Change Date'
  }]
  }
  Lastchangedat;

}