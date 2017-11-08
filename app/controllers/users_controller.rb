class UsersController < ApplicationController

  def index

    #назначено
    @user_tests_active = User_Test.where(user_id: current_user.id, status_id: 1)

    @mass_active = []

    @user_tests_active.each do |active|
      @test = Test.find_by(id: active.test_id)
      @mass_active.push(@test)
    end

    #пройдены
    @user_tests_passed = User_Test.where(user_id: current_user.id, status_id: 2)

    @mass_passed = []

    @user_tests_passed.each do |passed|
      @test = Test.find_by(id: passed.test_id)
      @mass_passed.push(@test)
    end

  end

  def new
    @user = User.new
  end

  def show

  end

  def create

      @user = User.new(user_params)
      if @user.save
        flash[:success] = 'Вы зарегистрировались!'
        sign_in(@user)
        redirect_to root_path
      else
        flash[:error] = 'Что то пошло не так!'
        render 'new'
      end

  end


  private

  def user_params
    params.require(:user).permit(:user_name, :surname, :email, :password, :password_confirmation)
  end


end