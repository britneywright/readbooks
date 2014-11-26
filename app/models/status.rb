class Status < ActiveRecord::Base
  belongs_to :book
  belongs_to :copy
end
