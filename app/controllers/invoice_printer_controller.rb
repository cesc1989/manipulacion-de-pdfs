class InvoicePrinterController < ApplicationController
  def index
    item = InvoicePrinter::Document::Item.new(
      name: 'Mototaxi',
      breakdown: 'Carrerita a la plaza de la paz',
      quantity: 2,
      unit: 'hours',
      price: '$ 50000',
      tax: '$ 15000',
      amount: '$ 100000'
    )
    invoice = InvoicePrinter::Document.new(
      number: '00055551111',
      provider_name: 'Motos Yaper',
      provider_tax_id: '11111111',
      provider_tax_id2: '422222',
      provider_lines: 'AVENIDA SIEMPRE VIVA',
      purchaser_name: 'Osnaider',
      purchaser_tax_id: '',
      purchaser_tax_id2: '',
      purchaser_lines: "",
      issue_date: '19/03/3939',
      due_date: '19/03/3939',
      subtotal: '175',
      tax: '16',
      tax2: '0',
      tax3: '0',
      total: '$ 200',
      bank_account_number: '20202020202',
      account_iban: 'IBAN464545645',
      account_swift: 'SWIFT5456',
      description: 'Se cobran las siguientes carreras:',
      items: [item],
      note: 'Mototaxis el Yaper'
    )

    respond_to do |format|
      format.pdf {
        @pdf = InvoicePrinter.render(
          document: invoice
        )
        send_data @pdf, type: 'application/pdf', disposition: 'inline'
      }
    end
  end
end
