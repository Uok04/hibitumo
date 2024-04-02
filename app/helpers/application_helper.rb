module ApplicationHelper
  def deadline_style(deadline)
    days_remaining = (deadline - Date.today).to_i
    if days_remaining <= 3
      "background-color: red;"
    elsif days_remaining <= 7
      "background-color: orange;"
    else
      "background-color: blue;"
    end
  end
end
