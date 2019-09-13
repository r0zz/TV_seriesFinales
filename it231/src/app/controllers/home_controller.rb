require 'digest/md5'
REALM = "localhost"

class HomeController < ApplicationController
  def home
  end

  def dataset
  end

  def browse
  end

 

  def search
     @results=0
      if !params[:searchinput].nil?
        @results=1
        @searchinput = params[:searchinput]
        @searchcriteria = "%"+@searchinput+"%"

        @tvsearch = FinaleRating.where("series like '"+@searchcriteria+"' or viewership like '"+@searchcriteria+"' or network like '"+@searchcriteria+"'
        or share like '"+@searchcriteria+"' or householdrating like '"+@searchcriteria+"'" )
      end  
  end

  def login
    @username = ''
    @password = ''
    userhash = {}
    user = ''
    userid = session[:user_id]
    if !userid.nil?
      user = User.where('id = ?', userid)[0]
      redirect_to home_user_path, :notice => "Welcome to your page, "+user.username    
    else
      if !params[:username].nil?

        if !params[:username].nil?
          @username = params[:username]
        end

        if !params[:password].nil?
          @password = params[:password]
        end

        user = User.where('username = ?', @username)[0]
        userhash.store(user.username, user.password)

        authenticate_or_request_with_http_digest(REALM) do |username|
          userhash[username]
          session[:user_id] = user.id
        end
      end
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to home_login_path, :notice => "You have been logged out"
  end

  def newuser
    @username = ''
    @password = ''
    @email = ''

    if !params[:username].nil?
      @username = params[:username]
    end

    if !params[:password].nil?
        @password = params[:password]
    end

    if !params[:email].nil?
        @email = params[:email]
    end

    if !params[:username].nil?
    @newUser = nil
    @newUser = User.new
    @newUser.username = @username
    @newUser.email = @email
    @newUser.password = Digest::MD5.hexdigest([@username, REALM, @password].join(":"))
    @newUser.save

     user = User.find_by_username(@username)
      if !user.nil?
        session[:user_id] = user.id
        redirect_to home_login_path, :notice => "Account created, please log in"
      else
        redirect_to root_url, :notice => "User creation failed, try again"
      end
    end 
  end

    def user
     @my_shows = FinaleRating.all
     @myitems = []
     @showID = nil
    
     
    user = User.where('id = ?', session[:user_id])[0]
    if !user.preferences.nil?
      @showID = eval(user.preferences)
      session[:saved_items] = @showID
    end
    
    
    if !@showID.nil?
      if @showID.length == 0
        @showID = nil
      end

      @showID.each do |sid|
        @myitems.push(FinaleRating.where('id = ?', sid )[0])
      end
    end 
  end

  def saveList
    savedArray = []
    if !session[:saved_items].nil?
      savedArray = session[:saved_items]
    end
    

    FinaleRating.all.each do |favorite|
      fav = params[favorite.id.to_s]
      if !fav.nil?
        savedArray.push(favorite.id)
      end
    end
    user = User.where('id = ?', session[:user_id])[0]
    user.preferences = savedArray
    user.save

    redirect_to home_user_path, :notice => "Item Has Been Added!"
  end

  def removeItems
    savedArray = []
    if !session[:saved_items].nil?
      savedArray = session[:saved_items]
    end
    
    savedArray.each do |fid|
      fav = params[fid.to_s]
      if !fav.nil?
        savedArray.delete(fid)
      end
    end
    user = User.where('id = ?', session[:user_id])[0]
    user.preferences = savedArray
    user.save

    redirect_to home_user_path, :notice => "Item Has Been Deleted!"
  end

  protected
  def authorize
    userhash = {}
    allUsers = User.all
    #User.all.each
    allUsers.each do |user|
      userhash.store(user.username, user.password)
      end
      authenticate_or_request_with_http_digest(REALM) do |username|
        userhash[username]
      end
    end
  
end
