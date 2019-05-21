require 'csv'
class TestTakersController < ActionController::Base

  def index
    list_takers = nil

    if params[:file] == 'csv'
      data = CSV.read("test_takers_list.csv")
      list_takers = convert_csv_into_json(data)
    else
      file = File.read("test_takers.json")
      list_takers = eval(file)[:test_takers]
    end

    if list_takers.blank?
      render json: { status: 422, error: "File does not have data"}, status: 422
      return
    end

    render json: list_takers
  end

  private

  def convert_csv_into_json(test_takers_list)
    attr = []

    test_takers_list.each do |user|
      next if user[0].blank? && user[1].blank?

      attr << {
        :name => user[0],
        :email => user[1],
      }
    end
    attr
  end

end
