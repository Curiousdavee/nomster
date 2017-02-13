class NotificationMailer < ActionMailer::Base
  default from: "no-reply@nomsterapp.com"

  def comment_added(comment) #object
    # @place = comment.place
    # why do i need to use an argument
    # so in this case, argument is indicating Comment db?
    # @place = Comment.place #class.model - no information
    @place_owner = @place.user
    mail(to: @place_owner.email,
         subject: "A comment has been added to #{@place.name}")
  end

end







