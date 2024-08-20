class AddCompanyReferenceToQuotes < ActiveRecord::Migration[7.1]
  def change
    # add reference on, to
    add_reference :quotes, :company, null: false, foreign_key: true
  end
end
