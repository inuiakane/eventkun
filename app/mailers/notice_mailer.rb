class NoticeMailer < ActionMailer::Base
  default from: "tanacobachie@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.send_notice.subject
  #
  def send_notice
    @greeting = "Hi"

    mail to: "tanacobachie@gmail.com"
  end
end
