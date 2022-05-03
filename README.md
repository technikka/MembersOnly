# MembersOnly

A simple message board project that implements an authentication system using the [Devise](https://github.com/heartcombo/devise) gem. This was a project recommended by [The Odin Project](https://www.theodinproject.com/lessons/ruby-on-rails-members-only) 

The idea here was that posts to the board should be public but only members who are authenticated can see who the author of a post is, and only members can contribute posts to the board.

Keeping the focus of the project on authentication, i've only implemented the obvious Member and Post models, with Post having only index, new, and create controller actions.

I added very basic css/grid to make working in this project more pleasing.

## Devise

This was my first time using the Devise authentication gem, which I found to be fantastically useful and an immense time saver with built-in helpers like #member_signed_in? and #current_member, and an entirely pre-built User controller and views. Wow, thank you to the [creator](https://github.com/heartcombo) for this beautiful tool. I look forward to exploring more modules within.

### Devise issues

These "issues" have now been replicated with every attempt to use Devise so ill make note of the solutions I implemented.

* Registering a new user causes "Undefined Method 'user_url' for Devise::RegistrationsController ..." My adopted fix is throwing this line in devise.rb:
  config.navigational_formats = ['*/*', :html, :turbo_stream] 

* Signing out causes "Routing Error: No route matches GET 'users/sign_out'". Setting 'method: :delete' does not work. My adopted fix is editing devise.rb:
  config.sign_out_via = :delete is the default so i change it to:
    config.sign_out_via = :get

* Successfully signing up as a new user does not automatically indicate to the user that a request was even sent. Turbo Drive needs a redirect and Devise needs to be told this. The way is to create a ReigstrationsController which inherits from Devise::RegistrationsController and declares a #after_sign_up_path_for (resource) method which returns the path for redirect.