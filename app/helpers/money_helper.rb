# frozen_string_literal: true

module MoneyHelper
  def format_amount_as_money(amount_in_cents)
    "R$#{amount_in_cents / 100},#{'%02d' % (amount_in_cents % 100)}"
  end
end