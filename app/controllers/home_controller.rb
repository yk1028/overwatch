class HomeController < ApplicationController
  def index
    unless user_signed_in?
      redirect_to '/users/sign_in'
    end
    
    #index.html의 checkbox로부터 정보를 불러온다.
    @gender = params[:gender]
    @age = params[:age]
    @position = params[:position]
    @tier = params[:tier]
    
    #정보가 있으면 해당하는 user들을 찾는다.
    if @gender and @age and @position and @tier
      @find_user = User.matching(@gender, @age, @position, @tier)
    end
  end
  
  def insert
    #register.html로부터 정보를 불러와서 등록한다.
    @user = User.find(current_user.id)
    @user.battletag = params[:battletag]
    @user.gender = params[:gender]
    @user.age = params[:age]
    @user.position = params[:position]
    @user.tier = params[:tier]
    @user.comment = params[:comment]
    @user.save
    
    redirect_to '/'
  end
    
end
