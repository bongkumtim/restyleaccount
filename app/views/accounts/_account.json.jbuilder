json.extract! account, :id, :opening_cash, :opening_bank, :user_id, :bank, :image, :cash_collection_amount, :cash_collection_description, :cash_purchase_amount, :cash_purchase_description, :credit_purchase_amount, :credit_purchase_description, :creditor_name, :payment_creditor_cash_amount, :payment_creditor_cash_description, :payment_creditor_bank_amount, :payment_creditor_bank_description, :card_collection_amount, :card_collection_description, :card_charges, :bank_transfer_amount, :bank_transfer_description, :fpx_collection_amount, :fpx_collection_description, :fpx_charges, :created_at, :updated_at
json.url account_url(account, format: :json)