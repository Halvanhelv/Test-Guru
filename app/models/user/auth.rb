module User::Auth
  extend ActiveSupport::Concern
  included do #модель вызывается на уровне класса и потому валидации нужно подключать когда вызывается класс через include
    validates :email, presence: true
    validates :password, presence: true, if: proc { |u| u.password_digest.blank? } # если захотел обновить пользователя то пароль в объекте не нужно узнавать, а только проверить есть ли он в БД,иначе не смогли бы обновлять пользователя не введя каждый раз пароль
    validates :password, presence: true, confirmation: true # Эта валидация создает виртуальный атрибут, имя которого равно имени подтверждаемого поля с добавлением "_confirmation".
  end
  attr_reader :password
  attr_writer :password_confirmation


  def authenticate(password_string)
    digest(password_string) == self.password_digest ? self : false

  end

  def password=(password_string)
    if password_string.nil?
      self.password_digest = nil # если пароль пустой то при попытке сохранения сработает валидация ибо она работает только при взаимодействии с бд
    elsif password_string.present?
      @password = password_string #сохраняем в инстанс переменной что бы при валидации могли проверить пароль на password_confirmation
      self.password_digest = digest(password_string)
    end
  end



  private

  def digest(string)
    Digest::SHA1.hexdigest(string)
  end
end
