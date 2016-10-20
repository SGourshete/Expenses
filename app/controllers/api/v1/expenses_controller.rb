class Api::V1::ExpensesController < Api::V1::BaseController

  def new

  end

  def index
#    render json: {some_data: 'some text'}
     exp = User.first.email
     if @user.nil?
       render json: 'Bad Credentials', status: :authorized
     else
       render json: {some_data: exp}
     end

  end

end
