FactoryBot.define do
  factory :pagamento do
    valor "9.99"
    data "2018-05-02"
    fatura_id 1
    fatura nil
  end
end
