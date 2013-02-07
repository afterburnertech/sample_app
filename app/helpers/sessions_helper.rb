module SessionsHelper

	def sign_in(user)
		cookies.permanent[:remember_token] = user.remember_token
		self.current_user = user
	end

	def current_user=(user)
		@current_user = user
	end

	def current_user
		#||= if current user is undefined, hit the database, otherwise return @current_user
		@current_user ||= User.find_by_remember_token(cookies[:remember_token])
	end

	def current_user?(user)
		user == current_user
	end

    def signed_in_user
      unless signed_in?
        #if a valid user tries to access a page, but hasn't signed in yet, 
        #store the page and ask them to sign in
        store_location
        #otherwise redirect to the sign in page
        redirect_to signin_url, notice: "Please sign in."
      end
    end

	def signed_in?
		!current_user.nil?
	end

	def sign_out
		self.current_user = nil
		cookies.delete(:remember_token)
	end

	#Friendly forwarding helper
	def redirect_back_or(default)
		redirect_to(session[:return_to] || default) #default if nil
		session.delete(:return_to)
	end

	def store_location
		session[:return_to] = request.url
	end
end
