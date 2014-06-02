module PurchasesHelper
  def display_invoice(purchase)
    unless purchase.invoice.nil?
      concat(raw "<p><strong>Invoice Reference Number:</strong>\n")
      concat(link_to @purchase.invoice.reference_number,
               edit_purchase_invoice_path(@purchase))
      concat(raw "</p>")
      concat(raw "<p>")
      concat(link_to "Delete Invoice", purchase_invoice_path(@purchase),
              :confirm => "Are you sure?", :method => :delete)
      concat(raw "</p>")
    else
      concat(raw "<p>")
      concat(link_to "Create Invoice", new_purchase_invoice_path(@purchase))
      concat(raw "</p>")
    end
  end
end