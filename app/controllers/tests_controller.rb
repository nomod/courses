class TestsController < ApplicationController

  before_action :admin, only: [:index, :create_dop_info]

  def index
    @user_test = User_Test.new
    @tests = Test.all.order(:id)
    @users = User.where(admin: false).order(:id)

  end

  def show

    @test = Test.find_by(id: params[:id])

  end

  def question

    if params[:finish_test]

      @test = Test.find_by(id: params[:test_id])
      @answer_question = Answer_Question.where(test_id: @test.id)

      @answers = []
      @answer_question.each do |question|
        @answers.push(Answer.find_by(id: question.question_id))
      end

      #ответы из формы
      @answers_from_form = params[:question]

      #счетчик правильных ответов
      @count = 0

      @answers_from_form.each_with_index do |answer, index|

        if answer == @answers[index].answer
          @count = @count + 1
        end

      end

      @user_test = User_Test.find_by(test_id: @test.id, user_id: current_user.id)

      if @user_test.update_attributes(status_id: 2)

        flash[:success] = "Тест пройден, ваш результат: #{@count}"
        redirect_to '/check'

      end

    else

      @test = Test.find_by(id: params[:id])

      @answer_question = Answer_Question.where(test_id: @test.id)

      @questions = []

      @answer_question.each do |question|
        @questions.push(Question.find_by(id: question.question_id))
      end

      respond_to do |format|
        format.json { render json: {test_id: @test.id, questions: @questions} }
      end


    end

  end

  def create


  end

  def create_dop_info

    if params[:user_test]

      @test_id = params[:user_test][:test_id]
      @user_id = params[:user_test][:user_id]

      if !@test_id.nil? && !@user_id.nil?
        @test_id.each do |test|
          @user_id.each do |user|

            if User_Test.create(user_id: user, test_id: test, status_id: 1)

            else
              flash[:error] = 'Что то пошло не так!'
              @user_test = User_Test.new
              @tests = Test.all.order(:id)
              @users = User.where(admin: false).order(:id)
              render 'index'
            end

          end

        end

        flash[:success] = 'Назначено!'
        redirect_to assign_path

      end

    else
      flash[:error] = 'Выбрать нужно хоть что то!'
      @user_test = User_Test.new
      @tests = Test.all.order(:id)
      @users = User.where(admin: false).order(:id)
      render 'index'
    end

  end

  private

  def admin
    if current_user.nil?
      flash[:notice] = 'Авторизуйтесь для продолжения!'
      redirect_to signin_url
    else
      if !current_user.admin?
        flash[:notice] = 'Вы не админ!'
        redirect_to root_path
      end
    end
  end


end