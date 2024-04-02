class ReceiptsController < ApplicationController
  def index
    respond_to do |format|
      format.pdf do
        send_data receipt.render, type: "application/pdf", disposition: :inline
      end
    end
  end

  private

  def receipt
    Receipts::Receipt.new(
      details: [
        ["No. Factura", "11111111"],
        ["Fecha de Pago", Date.current],
        ["Método de Pago", "Cuenta Bancaria xxx181279381"]
      ],
      company: {
        name: "Chichamentas el Yidio",
        address: "AVENIDA SIEMPRE VIVA",
        email: "support@example.com",
        logo: nil
      },
      recipient: [
        "Comensale",
        "Calle mill",
        "QuillaMi, ATL",
        nil,
        "customer@example.org"
      ],
      line_items: [
        ["<b>Item</b>", "<b>Unit Cost</b>", "<b>Quantity</b>", "<b>Amount</b>"],
        ["Subscription", "$19.00", "1", "$19.00"],
        [nil, nil, "Subtotal", "$19.00"],
        [nil, nil, "Tax", "$1.12"],
        [nil, nil, "Total", "$20.12"],
        [nil, nil, "<b>Amount paid</b>", "$20.12"],
        [nil, nil, "Refunded on #{Date.today}", "$5.00"]
      ],
      footer: "Gracias por preferir nuestras chichamentas."
    )
  end
end
