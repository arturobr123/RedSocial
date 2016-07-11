class Post < ApplicationRecord
  belongs_to :user #user_id
end

#CRUD: crear, leer, actualizar y eliminar
#1:N
#Post solo podia tener un usuario belong_to
#Usuario podia tener muchos post  has_many
